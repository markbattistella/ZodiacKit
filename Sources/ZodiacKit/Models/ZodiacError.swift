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
    /// Provides a readable explanation of the problem, typically for display in UI or debugging logs.
    /// Where appropriate, this includes formatted representations of the related data.
    public var errorDescription: String? {
        switch self {

            case .invalidDateComponents(let date):
                /// Indicates that the provided `Date` object has missing or invalid components.
                return "Invalid date components were found in \(compactDate(date))."

            case .couldNotConstructLeapDate(let month, let day):
                /// Indicates failure to build a valid `Date` using leap year logic.
                return "Could not construct a date for the given day (\(day)) and month (\(month)) using a leap year."

            case .couldNotGetDayOfYear(let adjustedDate):
                /// The system was unable to determine the ordinal day in the year for the given date.
                return "Unable to determine the day of the year for the adjusted date: \(compactDate(adjustedDate))."

            case .duplicateZodiacsFound(let duplicates):
                /// More than one zodiac definition was found for the same sign.
                let signs = duplicates.map(\.name).joined(separator: ", ")
                return "Duplicate zodiac signs found: \(signs). Each sign should only appear once."

            case .missingZodiacs(let missing):
                /// One or more expected zodiac signs were not included in the configuration.
                let signs = missing.map(\.name).joined(separator: ", ")
                return "Missing zodiac definitions for: \(signs). All expected signs must be present."

            case .missingDays(let missingDays):
                /// There are calendar days not covered by any zodiac sign.
                let formatted = missingDays.map { compactDate($0) }.joined(separator: ", ")
                return "Some days are not covered by any zodiac sign: \(formatted)."

            case .overlappingDays(let days):
                /// Two or more zodiac signs overlap on the same calendar days.
                let list = days.map(String.init).joined(separator: ", ")
                return "Multiple zodiac signs overlap on the same day(s): \(list). Each day should be uniquely assigned."

            case .nonContinuousRanges:
                /// The defined zodiac ranges are not continuous across the full year.
                return "Zodiac date ranges are not continuous. Every day of the year must be covered without gaps."

            case .invalidData:
                /// The zodiac data could not be parsed or was otherwise malformed.
                return "The zodiac data is invalid or corrupted."

            case .dayNumberNotFound(let dayNumber):
                /// No zodiac sign could be found for the specified day of the year.
                return "No zodiac sign was found for day number \(dayNumber)."
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
