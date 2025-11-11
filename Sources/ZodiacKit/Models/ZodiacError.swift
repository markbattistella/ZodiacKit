//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// Represents all possible errors that can occur while working with the zodiac system.
public enum ZodiacError: Error {

    /// The provided `Date` has missing or invalid components (e.g. nil day or month).
    case invalidDateComponents(date: Date)

    /// A date could not be constructed from the given month and day using the leap year.
    ///
    /// This typically means the combination is invalid (e.g. February 30).
    case couldNotConstructLeapDate(month: Int, day: Int)

    /// The system couldn't calculate the day of the year for the given date.
    ///
    /// This can happen if the adjusted date is invalid or out of bounds.
    case couldNotGetDayOfYear(adjustedDate: Date)

    /// There are duplicate zodiac entries for the same sign.
    ///
    /// This indicates a conflict in the zodiac configuration.
    case duplicateZodiacsFound(duplicates: [Western])

    /// One or more expected zodiac signs were not defined.
    ///
    /// All expected signs must be present for the system to be considered valid.
    case missingZodiacs(missing: [Western])

    /// One or more calendar days are not covered by any zodiac range.
    ///
    /// This breaks continuity and indicates an incomplete zodiac system.
    case missingDays(missingDays: [Date])

    /// One or more days are assigned to more than one zodiac sign.
    ///
    /// Each day of the year must map to a single sign only.
    case overlappingDays(days: [Int])

    /// The combined zodiac ranges do not form a continuous sequence from day 1 through 366.
    ///
    /// This suggests that the date ranges either overlap, leave gaps, or are unordered.
    case nonContinuousRanges

    /// The zodiac data is invalid or could not be parsed.
    ///
    /// This is a general-purpose fallback for unrecoverable or malformed data.
    case invalidData

    /// A zodiac sign could not be resolved for the specified day of the year.
    ///
    /// This typically means the mapping is incomplete or incorrectly indexed.
    case dayNumberNotFound(dayNumber: Int)
}

extension ZodiacError: LocalizedError {

    /// A user-facing description of the zodiac-related error.
    ///
    /// Each case uses `String(localized:)` to support translation.
    /// Use interpolated placeholders (`\(variable)`) for dynamic data.
    public var errorDescription: String? {
        switch self {

            case .invalidDateComponents(let date):
                return String(
                    localized: "Invalid date components were found in \(compactDate(date)).",
                    comment: "Shown when the provided date object has missing or invalid components."
                )

            case .couldNotConstructLeapDate(let month, let day):
                return String(
                    localized: "Could not construct a date for the given day (\(day)) and month (\(month)) using a leap year.",
                    comment: "Shown when date construction fails due to invalid leap year combination."
                )

            case .couldNotGetDayOfYear(let adjustedDate):
                return String(
                    localized: "Unable to determine the day of the year for the adjusted date: \(compactDate(adjustedDate)).",
                    comment: "Shown when system cannot calculate the day of the year from an adjusted date."
                )

            case .duplicateZodiacsFound(let duplicates):
                let signs = duplicates.map(\.name).joined(separator: ", ")
                return String(
                    localized: "Duplicate zodiac signs found: \(signs). Each sign should only appear once.",
                    comment: "Shown when more than one zodiac entry is found for the same sign."
                )

            case .missingZodiacs(let missing):
                let signs = missing.map(\.name).joined(separator: ", ")
                return String(
                    localized: "Missing zodiac definitions for: \(signs). All expected signs must be present.",
                    comment: "Shown when one or more expected zodiac signs are missing from configuration."
                )

            case .missingDays(let missingDays):
                let formatted = missingDays.map { compactDate($0) }.joined(separator: ", ")
                return String(
                    localized: "Some days are not covered by any zodiac sign: \(formatted).",
                    comment: "Shown when calendar days exist that are not assigned to any zodiac sign."
                )

            case .overlappingDays(let days):
                let list = days.map(String.init).joined(separator: ", ")
                return String(
                    localized: "Multiple zodiac signs overlap on the same day(s): \(list). Each day should be uniquely assigned.",
                    comment: "Shown when two or more zodiac ranges overlap on the same calendar days."
                )

            case .nonContinuousRanges:
                return String(
                    localized: "Zodiac date ranges are not continuous. Every day of the year must be covered without gaps.",
                    comment: "Shown when zodiac date ranges are not sequential or leave gaps."
                )

            case .invalidData:
                return String(
                    localized: "The zodiac data is invalid or corrupted.",
                    comment: "Shown when zodiac data cannot be parsed or is malformed."
                )

            case .dayNumberNotFound(let dayNumber):
                return String(
                    localized: "No zodiac sign was found for day number \(dayNumber).",
                    comment: "Shown when no zodiac mapping exists for the given day number."
                )
        }
    }
}

extension ZodiacError {

    /// A lightweight and efficient string formatter for displaying dates as `YYYY-MM-DD`.
    ///
    /// Designed for iOS 13 compatibility without using `DateFormatter` or `.formatted`.
    ///
    /// - Parameter date: The date to format.
    /// - Returns: A string in `YYYY-MM-DD` format.
    private func compactDate(_ date: Date) -> String {
        let components = Calendar.gregorian.dateComponents([.year, .month, .day], from: date)
        let year = components.year ?? 0
        let month = components.month ?? 0
        let day = components.day ?? 0
        return String(format: "%04d-%02d-%02d", year, month, day)
    }
}
