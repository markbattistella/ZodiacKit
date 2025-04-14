//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

internal extension Date {

    /// Creates a `Date` instance from individual day, month, and year components.
    ///
    /// - Parameters:
    ///   - day: The day component of the date.
    ///   - month: The month component of the date.
    ///   - year: The year component of the date.
    ///   - calendar: The calendar to use for date construction. Defaults to Gregorian.
    /// - Returns: A `Date` if the components form a valid date, otherwise `nil`.
    static func from(
        day: Int,
        month: Int,
        year: Int,
        calendar: Calendar = .gregorian
    ) -> Date? {
        calendar.date(from: DateComponents(year: year, month: month, day: day))
    }

    /// Returns the day of the year for the current date using a leap year as reference.
    ///
    /// This ensures consistency regardless of whether the year of `self` is a leap year.
    ///
    /// - Throws:
    ///   - `ZodiacError.invalidDateComponents` if the day or month can't be extracted.
    ///   - `ZodiacError.couldNotConstructLeapDate` if a leap-year date can't be formed.
    ///   - `ZodiacError.couldNotGetDayOfYear` if the ordinal day can't be determined.
    /// - Returns: The day of the year as an `Int`, where January 1st is 1.
    func dayOfYear() throws -> Int {
        let calendar = Calendar.gregorian
        let components = calendar.dateComponents([.day, .month], from: self)

        guard let day = components.day, let month = components.month else {
            throw ZodiacError.invalidDateComponents(date: self)
        }

        let dateComponents = DateComponents(year: Int.leapYear, month: month, day: day)

        guard let adjustedDate = calendar.date(from: dateComponents) else {
            throw ZodiacError.couldNotConstructLeapDate(month: month, day: day)
        }

        guard let dayOfYear = calendar.ordinality(of: .day, in: .year, for: adjustedDate) else {
            throw ZodiacError.couldNotGetDayOfYear(adjustedDate: adjustedDate)
        }

        return dayOfYear
    }
}
