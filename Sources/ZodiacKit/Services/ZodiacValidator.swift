//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// A utility responsible for validating arrays of `Zodiac` values.
///
/// Ensures that a zodiac system is fully defined, non-overlapping, and continuous across the year.
internal struct ZodiacValidator {

    /// Validates a zodiac configuration against a set of expected signs.
    ///
    /// This performs multiple validation steps:
    /// 1. Ensures no duplicate signs exist.
    /// 2. Ensures all expected signs are included.
    /// 3. Ensures every day of the year is covered by one and only one zodiac.
    /// 4. Ensures there are no overlapping date ranges.
    /// 5. Ensures the date ranges are continuous from day 1 through 366.
    ///
    /// - Parameters:
    ///   - zodiacs: The zodiac definitions to validate.
    ///   - expectedZodiacs: A set of expected signs for the system.
    /// - Throws: A `ZodiacError` describing the first validation failure encountered.
    internal static func validate(zodiacs: [Zodiac], expectedZodiacs: Set<Western>) throws {

        // Check for duplicate zodiac signs
        let duplicates = duplicateSigns(in: zodiacs)
        guard duplicates.isEmpty else {
            throw ZodiacError.duplicateZodiacsFound(duplicates: duplicates)
        }

        // Check for missing signs
        let missing = missingSigns(in: zodiacs, expected: expectedZodiacs)
        guard missing.isEmpty else {
            throw ZodiacError.missingZodiacs(missing: missing)
        }

        // Check all days of the year are covered
        try validateAllDaysCovered(zodiacs: zodiacs)

        // Check for no overlapping days
        try validateNoOverlap(zodiacs: zodiacs)

        // Check date ranges are continuous
        try validateContinuousRanges(zodiacs: zodiacs)
    }
}

// MARK: - Helpers

private extension ZodiacValidator {

    // MARK: - Duplicate and Missing Sign Checks

    /// Detects any duplicate zodiac signs in the input.
    ///
    /// - Parameter zodiacs: The array of zodiacs to inspect.
    /// - Returns: An array of duplicated `Western` signs.
    private static func duplicateSigns(
        in zodiacs: [Zodiac]
    ) -> [Western] {
        Dictionary(grouping: zodiacs, by: \.sign)
            .filter { $1.count > 1 }
            .map { $0.key }
    }

    /// Identifies any missing signs compared to the expected set.
    ///
    /// - Parameters:
    ///   - zodiacs: The current zodiac definitions.
    ///   - expected: The full set of signs expected to be present.
    /// - Returns: An array of missing `Western` signs.
    private static func missingSigns(
        in zodiacs: [Zodiac],
        expected: Set<Western>
    ) -> [Western] {
        let providedSigns = Set(zodiacs.map(\.sign))
        return Array(expected.subtracting(providedSigns))
    }

    // MARK: - Day Coverage Validation

    /// Ensures every day of the year is covered by the zodiac definitions.
    ///
    /// - Parameter zodiacs: The zodiacs to validate.
    /// - Throws: `ZodiacError.missingDays` if any days are left uncovered.
    private static func validateAllDaysCovered(
        zodiacs: [Zodiac]
    ) throws {
        var coveredDays = Set<Int>()

        for zodiac in zodiacs {
            let days = try DateUtils.daysInRange(from: zodiac.start, to: zodiac.end)
            coveredDays.formUnion(days)
        }

        let expectedDays = Set(1...Int.maxDayOfYear)
        let missingDays = expectedDays.subtracting(coveredDays)

        if !missingDays.isEmpty {
            let missingDates = missingDays.compactMap { Int.fromDayOfYear($0) }.sorted()
            throw ZodiacError.missingDays(missingDays: missingDates)
        }
    }

    // MARK: - Overlap Validation

    /// Ensures no overlapping day-of-year values exist across zodiac definitions.
    ///
    /// - Parameter zodiacs: The zodiacs to inspect.
    /// - Throws: `ZodiacError.overlappingDays` if any days are claimed by more than one sign.
    private static func validateNoOverlap(
        zodiacs: [Zodiac]
    ) throws {
        var seenDays = Set<Int>()
        var overlappingDays = Set<Int>()

        for zodiac in zodiacs {
            let days = try DateUtils.daysInRange(from: zodiac.start, to: zodiac.end)
            for day in days {
                if !seenDays.insert(day).inserted {
                    overlappingDays.insert(day)
                }
            }
        }

        if !overlappingDays.isEmpty {
            throw ZodiacError.overlappingDays(days: overlappingDays.sorted())
        }
    }

    // MARK: - Continuity Validation

    /// Validates that the combined date ranges are continuous from day 1 to day 366.
    ///
    /// - Parameter zodiacs: The zodiac definitions to validate.
    /// - Throws: `ZodiacError.nonContinuousRanges` if there are gaps or reordering.
    private static func validateContinuousRanges(
        zodiacs: [Zodiac]
    ) throws {
        let allDaysSorted = try zodiacs.flatMap {
            try DateUtils.daysInRange(from: $0.start, to: $0.end)
        }.sorted()

        guard allDaysSorted == Array(1...Int.maxDayOfYear) else {
            throw ZodiacError.nonContinuousRanges
        }
    }
}
