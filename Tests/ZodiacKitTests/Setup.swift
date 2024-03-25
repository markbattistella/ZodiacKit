//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import XCTest
@testable import ZodiacKit

/// A test suite for validating the functionality of the ZodiacKit, focusing on the `ZodiacService` 
/// and its ability to accurately determine zodiac signs and validate custom zodiac configurations.
class ZodiacKitTests: XCTestCase {

    // MARK: - variables

    /// A `DateValidator` instance used for validating dates within the zodiac service.
    var validator: DateValidator!

    /// An instance of `ZodiacService` used to perform zodiac sign determination and validation.
    var service: ZodiacService!

    // MARK: - setup

    /// Sets up necessary instances before each test is run. This includes initializing the 
    /// `validator` and `service` variables.
    override func setUp() {
        super.setUp()
        self.validator = DateValidator()
        self.service = try? ZodiacService()
    }

    // MARK: - helpers

    /// Tests the attributes of a zodiac sign for all cases within a given zodiac sign type.
    ///
    /// - Parameters:
    ///   - attributeName: The name of the attribute being tested.
    ///   - expectedValues: An array of expected values corresponding to each zodiac sign case.
    ///   - attributeClosure: A closure that, given a zodiac sign, returns the value of the 
    ///   attribute to be tested.
    internal func testAttribute<Z: ZodiacSign, T: Equatable>(
        attributeName: String,
        expectedValues: [T],
        attributeClosure: (Z) -> T
    ) {
        for (index, sign) in Z.allCases.enumerated() {
            XCTAssertEqual(
                attributeClosure(sign),
                expectedValues[index],
                "\(attributeName) is incorrect for \(sign.rawValue)"
            )
        }
    }

    /// Generates a `Date` object representing a specific day and month, used for testing 
    /// date-based functionality.
    ///
    /// - Parameters:
    ///   - day: The day of the month.
    ///   - month: The month of the year.
    /// - Returns: A `Date` object set to the specified day and month, within a fixed year.
    internal func generatedWesternDate(day: Int, month: Int) -> Date {
        let calendar = Calendar.current
        let components = DateComponents(year: 2000, month: month, day: day)
        return calendar.date(from: components)!
    }

    /// Creates a `WesternZodiac` instance with specified start and end dates, associated with 
    /// a particular zodiac sign.
    ///
    /// - Parameters:
    ///   - sign: The `WesternZodiacSign` associated with the zodiac period being created.
    ///   - startDay: The starting day of the zodiac period.
    ///   - startMonth: The starting month of the zodiac period.
    ///   - endDay: The ending day of the zodiac period.
    ///   - endMonth: The ending month of the zodiac period.
    /// - Returns: A `WesternZodiac` instance configured with the specified dates and sign.
    internal func makeWesternZodiac(
        sign: WesternZodiacSign,
        startDay: Int,
        startMonth: Int,
        endDay: Int,
        endMonth: Int
    ) -> WesternZodiac {
        return WesternZodiac(
            sign: sign,
            startDate: .init(day: startDay, month: startMonth),
            endDate: .init(day: endDay, month: endMonth)
        )
    }
}
