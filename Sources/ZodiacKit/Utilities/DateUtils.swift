//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// Utility methods for working with zodiac-related date ranges.
internal enum DateUtils {

    /// Computes all day-of-year values between two `ZodiacDay` values.
    ///
    /// This function handles wraparound cases (e.g. Capricorn: Dec 22 – Jan 19) by spanning from
    /// the `start` day to the end of the year, then continuing from day 1 to the `end`.
    ///
    /// - Parameters:
    ///   - start: The starting `ZodiacDay`.
    ///   - end: The ending `ZodiacDay`.
    /// - Throws:
    ///   - `ZodiacError.couldNotConstructLeapDate` if a date cannot be created.
    ///   - `ZodiacError.couldNotGetDayOfYear` if the day-of-year cannot be calculated.
    /// - Returns: An array of integers representing all covered day-of-year values (1–366).
    internal static func daysInRange(
        from start: Zodiac.ZodiacDay,
        to end: Zodiac.ZodiacDay
    ) throws -> [Int] {
        let startDay = try start.toDate().dayOfYear()
        let endDay = try end.toDate().dayOfYear()
        
        if endDay >= startDay {
            return Array(startDay...endDay)
        } else {
            // Wraps around the year boundary
            return Array(startDay...Int.maxDayOfYear) + Array(1...endDay)
        }
    }
}
