//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// The bundle associated with the current Swift Package module.
///
/// Use this property to access resources (such as assets, storyboards, or JSON files) included in
/// the package target’s bundle.
public let module: Bundle = .module

/// A representation of a zodiac sign and its corresponding date range.
public struct Zodiac: Codable {

    /// The western zodiac sign.
    public let sign: Western

    /// The start date of the zodiac sign’s period.
    public let start: ZodiacDay

    /// The end date of the zodiac sign’s period.
    public let end: ZodiacDay
}

extension Zodiac {

    /// A day and month pair representing a date in the zodiac calendar.
    ///
    /// Used for date comparisons and calculations independent of year.
    public struct ZodiacDay: Codable {

        /// The day of the month (1–31).
        public let day: Int

        /// The month of the year (1–12).
        public let month: Int

        /// Converts the `ZodiacDay` into a full `Date` using a leap year for consistency.
        ///
        /// This ensures February 29 is always valid and allows consistent day-of-year comparisons.
        ///
        /// - Throws: `ZodiacError.couldNotConstructLeapDate` if the date cannot be constructed.
        /// - Returns: A `Date` representing this `ZodiacDay` within the leap year.
        internal func toDate() throws -> Date {
            let components = DateComponents(year: Int.leapYear, month: self.month, day: self.day)
            guard let date = Calendar.gregorian.date(from: components) else {
                throw ZodiacError.couldNotConstructLeapDate(month: month, day: day)
            }
            return date
        }
    }
}

// MARK: - Conformances

extension Zodiac: Equatable, Hashable {}
extension Zodiac.ZodiacDay: Equatable, Hashable {}

extension Zodiac.ZodiacDay: Comparable {

    /// Compares two `ZodiacDay` values chronologically.
    ///
    /// - Parameters:
    ///   - lhs: The first day to compare.
    ///   - rhs: The second day to compare.
    /// - Returns: `true` if `lhs` is earlier in the year than `rhs`.
    public static func < (lhs: Self, rhs: Self) -> Bool {
        (lhs.month, lhs.day) < (rhs.month, rhs.day)
    }
}
