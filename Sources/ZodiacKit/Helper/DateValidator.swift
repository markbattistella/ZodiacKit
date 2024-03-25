//
//  ZodiacKit
//  Created by Mark Battistella
//

import Foundation

/// Implementation of ZodiacValidator
public struct DateValidator: Validator {

    /// The leap year used for date calculations
    private let leapYear: Int = 2000

    /// Validates the given array of zodiacs to ensure they meet the specified criteria.
    ///
    /// - Parameters:
    ///   - zodiacs: The array of zodiacs to validate.
    /// - Throws: An error of type `ZodiacError` if validation fails.
    public func validate(zodiacs: [WesternZodiac]) throws {

        // -- ensure there are no duplicate zodiac signs
        let uniqueZodiacs = Set(zodiacs.map { $0.sign })
        guard uniqueZodiacs.count == zodiacs.count else {
            throw ZodiacError.duplicatedZodiac
        }

        // -- sort the zodiacs based on the start date
        let sortedZodiacs = sortZodiacs(zodiacs: zodiacs)

        var previousZodiac: WesternZodiac?

        for zodiac in sortedZodiacs {
            if let previousZodiac = previousZodiac {

                // -- check for overlapping dates
                if zodiac.startDate.month < previousZodiac.endDate.month ||
                    (zodiac.startDate.month == previousZodiac.endDate.month &&
                     zodiac.startDate.day <= previousZodiac.endDate.day) {
                    throw ZodiacError.overlappingDates
                }

                // -- check for missing dates
                let missingDates = findMissingDates(
                    startMonth: previousZodiac.endDate.month,
                    startDay: previousZodiac.endDate.day,
                    endMonth: zodiac.startDate.month,
                    endDay: zodiac.startDate.day
                )
                if !missingDates.isEmpty {
                    throw ZodiacError.missingDates(missingDates: missingDates)
                }
            }
            previousZodiac = zodiac
        }

        // -- check for missing zodiac signs
        if uniqueZodiacs.count != WesternZodiacSign.allCases.count {
            throw ZodiacError.missingZodiac
        }
    }

    /// Sorts the array of zodiacs based on the start date
    /// - Parameter zodiacs: Array of `Zodiac` to be sorted
    /// - Returns: Sorted array of `Zodiac`
    private func sortZodiacs(zodiacs: [WesternZodiac]) -> [WesternZodiac] {

        // -- sort the zodiacs based on the start date
        return zodiacs.sorted { $0.startDate.month == $1.startDate.month ?

            // -- if the start months are the same, compare the start days
            $0.startDate.day < $1.startDate.day :

            // -- if the start months are different, compare the start months
            $0.startDate.month < $1.startDate.month
        }
    }

    /// Finds the missing dates between two given dates
    /// - Parameters:
    ///   - startMonth: The month of the start date
    ///   - startDay: The day of the start date
    ///   - endMonth: The month of the end date
    ///   - endDay: The day of the end date
    /// - Returns: An array of missing dates as `DateComponents`
    private func findMissingDates(
        startMonth: Int,
        startDay: Int,
        endMonth: Int,
        endDay: Int
    ) -> [DateComponents] {
        let calendar = Calendar.current
        let startDate = calendar.date(from: DateComponents(year: leapYear,
                                                           month: startMonth,
                                                           day: startDay))!
        let endDate = calendar.date(from: DateComponents(year: leapYear,
                                                         month: endMonth,
                                                         day: endDay))!
        var missingDates: [DateComponents] = []

        // -- enumerate through dates starting after the startDate
        calendar.enumerateDates(
            startingAfter: startDate,
            matching: DateComponents(hour: 0),
            matchingPolicy: .nextTime
        ) { (date, _, stop) in
            guard let date = date else { return }
            if date < endDate {
                // -- append the day and month components of the date to missingDates
                missingDates.append(calendar.dateComponents([.day, .month], from: date))
            } else {
                stop = true
            }
        }
        return missingDates
    }

    /// Returns the day of the year for the given day and month
    /// - Parameters:
    ///   - day: The day of the month
    ///   - month: The month of the year
    /// - Throws: `ZodiacError.dateCalculationError` if the date can't be calculated
    /// - Returns: Day of the year as `Int`
    internal func dayOfYear(day: Int, month: Int) throws -> Int {

        // -- create date components using the leapYear flag and the provided day and month values
        let dateComponents = DateComponents(year: leapYear, month: month, day: day)
        let calendar = Calendar.current

        // -- try to create a date from the date components
        guard let date = calendar.date(from: dateComponents),
              let dayOfYear = calendar.ordinality(of: .day, in: .year, for: date) else {

            // -- if the date calculation fails, throw a ZodiacError.dateCalculationError
            throw ZodiacError.dateCalculationError
        }

        // -- return the calculated day of the year
        return dayOfYear
    }
}
