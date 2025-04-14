//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

internal extension Int {

    /// A leap year used as a fixed reference point for calendar calculations.
    static let leapYear: Int = 2000

    /// The maximum number of days in a leap year (366).
    static let maxDayOfYear = 366

    /// The number of years in the Chinese zodiac cycle.
    static let chineseZodiacCycle = 12

    /// Converts a day-of-year integer into a `Date` using a leap year as the base year.
    ///
    /// This method uses the year defined in `Int.leapYear` to ensure it can always resolve day
    /// 366 (February 29), which is not present in non-leap years.
    ///
    /// - Parameter dayOfYear: The day of the year (1–366).
    /// - Returns: A `Date` if the value is valid within the leap year, otherwise `nil`.
    static func fromDayOfYear(_ dayOfYear: Int) -> Date? {
        let calendar = Calendar.gregorian
        return calendar.date(from: DateComponents(year: Int.leapYear, day: dayOfYear))
    }
}
