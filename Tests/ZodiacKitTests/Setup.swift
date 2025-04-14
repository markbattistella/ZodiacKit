//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import XCTest
@testable import ZodiacKit

@MainActor
final class ZodiacKitTests: XCTestCase {

    var service: ZodiacService!

    override func setUp() {
        super.setUp()
        self.service = ZodiacService()
    }

    internal func assertZodiacAttribute<Z: ZodiacMetadataRepresentable, T: Equatable>(
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

    internal func assertZodiacError(
        _ error: Error,
        expected: ZodiacError,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        switch (error, expected) {

            case (ZodiacError.duplicateZodiacsFound, .duplicateZodiacsFound),
                (ZodiacError.missingZodiacs, .missingZodiacs),
                (ZodiacError.missingDays, .missingDays),
                (ZodiacError.overlappingDays, .overlappingDays),
                (ZodiacError.nonContinuousRanges, .nonContinuousRanges),
                (ZodiacError.invalidData, .invalidData),
                (ZodiacError.dayNumberNotFound, .dayNumberNotFound),
                (ZodiacError.invalidDateComponents, .invalidDateComponents),
                (ZodiacError.couldNotConstructLeapDate, .couldNotConstructLeapDate),
                (ZodiacError.couldNotGetDayOfYear, .couldNotGetDayOfYear):

                break // Considered matching — ignoring associated values

            default:
                XCTFail("Expected \(expected), but got \(error)", file: file, line: line)
        }
    }

    internal func date(_ day: Int, _ month: Int) -> Date {
        Calendar.gregorian.date(from: DateComponents(year: .leapYear, month: month, day: day))!
    }

    internal let systemsToTest: [(WesternZodiacSystem, String)] = [
        (.tropical, "Tropical"),
        (.sidereal, "Sidereal"),
        (.equalLength, "Equal"),
        (.astronomicalIAU, "IAU"),
        (.custom(Fixtures.validMonthBasedZodiacs()), "Custom Month-Based")
    ]
}

// MARK: - Test Fixtures

internal extension ZodiacKitTests {

    enum Fixtures {

        static func validMonthBasedZodiacs() -> [Zodiac] {
            return [
                .init(
                    sign: .capricorn,
                    start: .init(day: 1, month: 1),
                    end: .init(day: 31, month: 1)
                ),
                .init(
                    sign: .aquarius,
                    start: .init(day: 1, month: 2),
                    end: .init(day: 29, month: 2)
                ),
                .init(
                    sign: .pisces,
                    start: .init(day: 1, month: 3),
                    end: .init(day: 31, month: 3)
                ),
                .init(
                    sign: .aries,
                    start: .init(day: 1, month: 4),
                    end: .init(day: 30, month: 4)
                ),
                .init(
                    sign: .taurus,
                    start: .init(day: 1, month: 5),
                    end: .init(day: 31, month: 5)
                ),
                .init(
                    sign: .gemini,
                    start: .init(day: 1, month: 6),
                    end: .init(day: 30, month: 6)
                ),
                .init(
                    sign: .cancer,
                    start: .init(day: 1, month: 7),
                    end: .init(day: 31, month: 7)
                ),
                .init(
                    sign: .leo,
                    start: .init(day: 1, month: 8),
                    end: .init(day: 31, month: 8)
                ),
                .init(
                    sign: .virgo,
                    start: .init(day: 1, month: 9),
                    end: .init(day: 30, month: 9)
                ),
                .init(
                    sign: .libra,
                    start: .init(day: 1, month: 10),
                    end: .init(day: 31, month: 10)
                ),
                .init(
                    sign: .scorpio,
                    start: .init(day: 1, month: 11),
                    end: .init(day: 30, month: 11)
                ),
                .init(
                    sign: .sagittarius,
                    start: .init(day: 1, month: 12),
                    end: .init(day: 31, month: 12)
                )
            ]
        }

        static func withMissingDates() -> [Zodiac] {
            var zodiacs = validMonthBasedZodiacs()
            zodiacs[0] = .init(
                sign: .capricorn,
                start: .init(day: 1, month: 1),
                end: .init(day: 30, month: 1)
            )
            return zodiacs
        }

        static func withOverlappingDates() -> [Zodiac] {
            var zodiacs = validMonthBasedZodiacs()
            zodiacs[1] = .init(
                sign: .aquarius,
                start: .init(day: 31, month: 1),
                end: .init(day: 29, month: 2)
            )
            return zodiacs
        }

        static func withDuplicateSigns() -> [Zodiac] {
            var zodiacs = validMonthBasedZodiacs()
            zodiacs[1] = zodiacs[0]
            return zodiacs
        }
    }
}
