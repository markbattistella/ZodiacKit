//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import XCTest
@testable import ZodiacKit

// MARK: - Custom Western Zodiacs

extension ZodiacKitTests {

    /// Validates that a correctly constructed custom zodiac array (with one full sign per month)
    /// passes validation without throwing any errors.
    ///
    /// This is used as the baseline for custom `.custom()` systems.
    func testValidZodiacs() {
        let zodiacs = Fixtures.validMonthBasedZodiacs()
        let expectedSigns = Set(zodiacs.map(\.sign))
        XCTAssertNoThrow(
            try ZodiacValidator.validate(zodiacs: zodiacs, expectedZodiacs: expectedSigns)
        )
    }

    /// Ensures that the validator throws a `.missingDates` error when there are gaps between
    /// zodiac ranges (i.e., unassigned days).
    ///
    /// This test uses a modified fixture where January ends on the 30th.
    func testZodiacValidation_ThrowsForMissingDates() {
        let zodiacs = Fixtures.withMissingDates()
        let expectedSigns = Set(zodiacs.map(\.sign))

        XCTAssertThrowsError(
            try ZodiacValidator.validate(zodiacs: zodiacs, expectedZodiacs: expectedSigns)
        ) { error in
            assertZodiacError(error, expected: .missingDays(missingDays: []))
        }
    }

    /// Ensures that the validator throws an `.overlappingDates` error when one sign's date
    /// range overlaps with another's.
    ///
    /// This test uses a modified fixture where Aquarius begins on January 31,
    /// overlapping with the end of Capricorn.
    func testZodiacValidation_ThrowsForOverlappingDates() {
        let zodiacs = Fixtures.withOverlappingDates()
        let expectedSigns = Set(zodiacs.map(\.sign))

        XCTAssertThrowsError(
            try ZodiacValidator.validate(zodiacs: zodiacs, expectedZodiacs: expectedSigns)
        ) { error in
            assertZodiacError(error, expected: .overlappingDays(days: []))
        }
    }

    /// Ensures that the validator throws a `.duplicatedZodiac` error when two entries use the
    /// same zodiac sign.
    ///
    /// This test uses a fixture where both Capricorn and Aquarius are set to Capricorn.
    func testZodiacValidation_ThrowsForDuplicateSigns() {
        let zodiacs = Fixtures.withDuplicateSigns()
        let expectedSigns = Set(Western.tropicalCases)

        XCTAssertThrowsError(
            try ZodiacValidator.validate(zodiacs: zodiacs, expectedZodiacs: expectedSigns)
        ) { error in
            assertZodiacError(error, expected: .duplicateZodiacsFound(duplicates: []))
        }
    }
}
