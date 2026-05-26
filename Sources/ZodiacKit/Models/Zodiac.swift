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
public struct Zodiac: Codable, Sendable {

  /// The western zodiac sign.
  public let sign: Western

  /// The start date of the zodiac sign’s period.
  public let start: ZodiacDay

  /// The end date of the zodiac sign’s period.
  public let end: ZodiacDay

  /// Creates a zodiac sign definition with an inclusive start and end day.
  ///
  /// - Parameters:
  ///   - sign: The Western zodiac sign represented by the date range.
  ///   - start: The first day included in the sign's range.
  ///   - end: The final day included in the sign's range.
  public init(sign: Western, start: ZodiacDay, end: ZodiacDay) {
    self.sign = sign
    self.start = start
    self.end = end
  }
}

extension Zodiac {

  /// A day and month pair representing a date in the zodiac calendar.
  ///
  /// Used for date comparisons and calculations independent of year.
  public struct ZodiacDay: Codable, Sendable {

    /// The day of the month (1–31).
    public let day: Int

    /// The month of the year (1–12).
    public let month: Int

    /// Creates a day and month pair for a zodiac date range.
    ///
    /// - Parameters:
    ///   - day: The day of the month.
    ///   - month: The month of the year.
    public init(day: Int, month: Int) {
      self.day = day
      self.month = month
    }

    /// Converts the `ZodiacDay` into a full `Date` using a leap year for consistency.
    ///
    /// This ensures February 29 is always valid and allows consistent day-of-year comparisons.
    ///
    /// - Throws: `ZodiacError.couldNotConstructLeapDate` if the date cannot be constructed.
    /// - Returns: A `Date` representing this `ZodiacDay` within the leap year.
    internal func toDate() throws -> Date {
      guard let date = Date.from(day: day, month: month, year: Int.leapYear) else {
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
