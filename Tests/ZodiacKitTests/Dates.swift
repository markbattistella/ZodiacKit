//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import XCTest
@testable import ZodiacKit

// MARK: - Western Zodiac Tests: Dates
extension ZodiacKitTests {

    /// Tests that the service correctly identifies the Western Zodiac sign based on the 
    /// start date of each sign's period.
    func testStartDateReturnsCorrectSign() {
        let testCases: [(day: Int, month: Int, expectedSign: WesternZodiacSign)] = [
            // Each tuple represents the boundary start date for a zodiac sign and the expected sign.
            (day: 20, month: 1, expectedSign: .aquarius),
            (day: 19, month: 2, expectedSign: .pisces),
            (day: 21, month: 3, expectedSign: .aries),
            (day: 20, month: 4, expectedSign: .taurus),
            (day: 21, month: 5, expectedSign: .gemini),
            (day: 21, month: 6, expectedSign: .cancer),
            (day: 23, month: 7, expectedSign: .leo),
            (day: 23, month: 8, expectedSign: .virgo),
            (day: 23, month: 9, expectedSign: .libra),
            (day: 23, month: 10, expectedSign: .scorpio),
            (day: 22, month: 11, expectedSign: .sagittarius),
            (day: 22, month: 12, expectedSign: .capricorn)
        ]
        for testCase in testCases {
            let date = generatedWesternDate(day: testCase.day, month: testCase.month)
            let resultSign = try? service.getWesternZodiac(from: date)
            XCTAssertEqual(resultSign, testCase.expectedSign, "Failed for date: \(testCase.day)/\(testCase.month)")
        }
    }

    /// Tests that the service correctly identifies the Western Zodiac sign based on the 
    /// end date of each sign's period.
    func testEndDateReturnsCorrectSign() {
        let testCases: [(day: Int, month: Int, expectedSign: WesternZodiacSign)] = [
            // Each tuple represents the boundary end date for a zodiac sign and the expected sign.
            (day: 18, month: 2, expectedSign: .aquarius),
            (day: 20, month: 3, expectedSign: .pisces),
            (day: 19, month: 4, expectedSign: .aries),
            (day: 20, month: 5, expectedSign: .taurus),
            (day: 20, month: 6, expectedSign: .gemini),
            (day: 22, month: 7, expectedSign: .cancer),
            (day: 22, month: 8, expectedSign: .leo),
            (day: 22, month: 9, expectedSign: .virgo),
            (day: 22, month: 10, expectedSign: .libra),
            (day: 21, month: 11, expectedSign: .scorpio),
            (day: 21, month: 12, expectedSign: .sagittarius),
            (day: 19, month: 1, expectedSign: .capricorn)
        ]
        for testCase in testCases {
            let date = generatedWesternDate(day: testCase.day, month: testCase.month)
            let resultSign = try? service.getWesternZodiac(from: date)
            XCTAssertEqual(resultSign, testCase.expectedSign, 
                           "End date failed for \(testCase.expectedSign)")
        }
    }

    /// Tests that the service correctly identifies the Western Zodiac sign for dates falling 
    /// in the middle of each sign's period.
    func testDateInMiddleReturnsCorrectSign() {
        let orderedSigns: [WesternZodiacSign] = [
            .aquarius, .pisces, .aries, .taurus, .gemini,
            .cancer, .leo, .virgo, .libra, .scorpio,
            .sagittarius, .capricorn
        ]
        let testCases = orderedSigns.enumerated().map { (index, sign) -> (day: Int, month: Int, expectedSign: WesternZodiacSign) in
            // Maps each sign to its chronological month and sets a day in the middle of the month.
            let month = index + 2
            let adjustedMonth = month > 12 ? month - 12 : month
            return (day: 10, month: adjustedMonth, expectedSign: sign)
        }
        for testCase in testCases {
            let date = generatedWesternDate(day: testCase.day, month: testCase.month)
            let resultSign = try? service.getWesternZodiac(from: date)
            XCTAssertEqual(resultSign, testCase.expectedSign,
                           "\(testCase.expectedSign) was expected but got \(String(describing: resultSign)) for date in the middle of the sign's period: \(testCase.month)/10")
        }
    }

    /// Validates the service's ability to correctly identify and accept a custom set of valid
    /// Western Zodiac periods without throwing an error.
    func testCustomZodiacsValidation() {
        let customZodiacsValid: [WesternZodiac] = WesternZodiacSign.allCases.enumerated().map { index, sign in
            // Setup for each sign with custom valid start and end dates.
            let isShortMonth = [4, 6, 9, 11].contains(index + 1)
            let isFebruary = index + 1 == 2
            let endDateDay = isFebruary ? 29 : (isShortMonth ? 30 : 31)
            return WesternZodiac(
                sign: sign,
                startDate: .init(day: 1, month: index + 1),
                endDate: .init(day: endDateDay, month: index + 1)
            )
        }
        XCTAssertNoThrow(try validator.validate(zodiacs: customZodiacsValid), 
                         "Validation should pass for correctly defined custom zodiacs.")
    }

    /// Tests the validation logic to ensure it throws an error for a custom set of zodiac periods
    /// containing duplicates, simulating an invalid configuration.
    func testCustomZodiacsValidationThrowsErrorDuplicate() {
        let customZodiacsInvalid = [
            // Setup including a duplicate to trigger validation error.
            makeWesternZodiac(sign: .aquarius, startDay: 1, startMonth: 1, endDay: 31, endMonth: 1),
            makeWesternZodiac(sign: .aquarius, startDay: 1, startMonth: 1, endDay: 31, endMonth: 1)
        ] + WesternZodiacSign.allCases.dropFirst().enumerated().map { index, sign -> WesternZodiac in
            let month = index + 2
            let startDay = 1
            let endDay = month % 2 == 0 ? 30 : 31
            return makeWesternZodiac(sign: sign, startDay: startDay, startMonth: month, endDay: endDay, endMonth: month)
        }
        XCTAssertThrowsError(try validator.validate(zodiacs: customZodiacsInvalid))
    }

    /// Tests the validation of custom zodiac configurations for missing dates. Specifically,
    /// it adjusts the end date for Aquarius to simulate a scenario where the date range is 
    /// incomplete, potentially leaving gaps in the calendar coverage.
    func testCustomZodiacsValidationThrowsErrorMissingDates() {

        // Generate custom zodiac configurations with an intentionally incorrect date range for Aquarius
        let customZodiacsInvalid: [WesternZodiac] = WesternZodiacSign.allCases.enumerated().map { index, sign in
            let month = index + 1

            // Set Aquarius to end prematurely to simulate missing dates
            let endDateDay = (sign == .aquarius) ? 10 : (month == 2 ? 29 : (month % 2 == 1 ? 31 : 30))
            return WesternZodiac(
                sign: sign,
                startDate: .init(day: 1, month: month),
                endDate: .init(day: endDateDay, month: month)
            )
        }
        XCTAssertThrowsError(try validator.validate(zodiacs: customZodiacsInvalid)) { error in
            print("Validation correctly failed with error: \(error)")
        }
    }

    /// Tests the validation of custom zodiac configurations for overlapping dates. This test
    /// ensures the validation logic catches configurations where one zodiac sign's date range
    /// improperly extends into another sign's range.
    func testCustomZodiacsValidationThrowsErrorOverlappingDates() {

        // Start with a valid configuration of zodiacs
        var customZodiacsInvalid: [WesternZodiac] = WesternZodiacSign.allCases.enumerated().map { index, sign in
            let month = index + 1
            let startDay = 1
            let endDateDay = month == 2 ? 29 : (month % 2 == 1 ? 31 : 30)  // Simplified for example

            return WesternZodiac(
                sign: sign,
                startDate: .init(day: startDay, month: month),
                endDate: .init(day: endDateDay, month: month)
            )
        }

        // Introduce an overlapping date range between Aquarius and Pisces
        if let aquariusIndex = WesternZodiacSign.allCases.firstIndex(of: .aquarius),
           let piscesIndex = WesternZodiacSign.allCases.firstIndex(of: .pisces) {

            // Extend Aquarius to overlap with the start of Pisces
            customZodiacsInvalid[aquariusIndex] = WesternZodiac(
                sign: .aquarius,
                startDate: .init(day: 1, month: 1),
                endDate: .init(day: 1, month: 2)
            )

            // Adjust Pisces start date to emphasize the overlap
            customZodiacsInvalid[piscesIndex] = WesternZodiac(
                sign: .pisces,
                startDate: .init(day: 1, month: 2),
                endDate: .init(day: 29, month: 2)
            )
        }
        XCTAssertThrowsError(try validator.validate(zodiacs: customZodiacsInvalid),
                             "Expected validation to fail due to overlapping zodiac dates.")
    }
}
