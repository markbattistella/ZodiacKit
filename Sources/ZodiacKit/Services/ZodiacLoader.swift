//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// A utility enum for loading and transforming zodiac data based on a specified system.
internal enum ZodiacLoader {

    /// Loads an array of `Zodiac` values based on the provided `WesternZodiacSystem`.
    ///
    /// This method selects the appropriate preset or custom configuration for the system and
    /// validates the loaded zodiacs to ensure they cover all expected signs.
    ///
    /// - Parameter system: The zodiac system to load (`tropical`, `sidereal`, etc.).
    /// - Throws: `ZodiacError.validationFailed` if validation fails.
    /// - Returns: An array of validated `Zodiac` instances.
    static func loadZodiacs(from system: WesternZodiacSystem) throws -> [Zodiac] {
        let zodiacs: [Zodiac]
        let expectedSigns: Set<Western>

        switch system {
            case .tropical:
                zodiacs = ZodiacPresets.tropical
                expectedSigns = Set(Western.tropicalCases)

            case .sidereal:
                zodiacs = ZodiacPresets.sidereal
                expectedSigns = Set(Western.siderealCases)

            case .equalLength:
                zodiacs = ZodiacPresets.equalLength
                expectedSigns = Set(Western.equalLengthCases)

            case .astronomicalIAU:
                zodiacs = ZodiacPresets.astronomicalIAU
                expectedSigns = Set(Western.astronomicalIAUCases)

            case .custom(let custom):
                zodiacs = custom
                expectedSigns = Set(custom.map(\.sign))
        }

        // Validate loaded zodiacs match the expected set
        try ZodiacValidator.validate(zodiacs: zodiacs, expectedZodiacs: expectedSigns)
        return zodiacs
    }

    /// Maps a list of `Zodiac` entries to a dictionary keyed by day-of-year.
    ///
    /// Each day of the year within a zodiac's date range is associated with that sign. Useful for
    /// fast lookup by date (e.g. "what sign is this day?").
    ///
    /// - Parameter zodiacs: An array of zodiac date ranges.
    /// - Throws: Errors if any date range is invalid or cannot be processed.
    /// - Returns: A dictionary mapping day-of-year integers (1–366) to `Western` signs.
    static func mapZodiacsToDaysOfYear(from zodiacs: [Zodiac]) throws -> [Int: Western] {
        var mapping: [Int: Western] = [:]

        for zodiac in zodiacs {
            let days = try DateUtils.daysInRange(from: zodiac.start, to: zodiac.end)
            for day in days {
                mapping[day] = zodiac.sign
            }
        }

        return mapping
    }
}
