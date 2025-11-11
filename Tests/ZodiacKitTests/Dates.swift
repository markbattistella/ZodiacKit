//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import XCTest
@testable import ZodiacKit

// MARK: - System Start/End/Middle Date Tests

@MainActor
extension ZodiacKitTests {

    func testStartDatesReturnCorrectSignForAllSystems() throws {
        for (system, label) in systemsToTest {
            let service = ZodiacService(system: system)
            for zodiac in service.zodiacs {
                let startDate = try zodiac.start.toDate()
                let result = try service.getWesternZodiac(from: startDate)
                XCTAssertEqual(
                    result,
                    zodiac.sign,
                    "\(label): Expected \(zodiac.sign) for start date \(zodiac.start)"
                )
            }
        }
    }

    func testEndDatesReturnCorrectSignForAllSystems() throws {
        for (system, label) in systemsToTest {
            let service = ZodiacService(system: system)
            for zodiac in service.zodiacs {
                let endDate = try zodiac.end.toDate()
                let result = try service.getWesternZodiac(from: endDate)
                XCTAssertEqual(
                    result,
                    zodiac.sign,
                    "\(label): Expected \(zodiac.sign) for end date \(zodiac.end)"
                )
            }
        }
    }

    func testMiddleDatesReturnCorrectSignForAllSystems() throws {
        for (system, label) in systemsToTest {
            let service = ZodiacService(system: system)

            for zodiac in service.zodiacs {
                guard
                    let startDate = try? zodiac.start.toDate(),
                    var endDate = try? zodiac.end.toDate()
                else {
                    XCTFail("Could not resolve dates for \(zodiac.sign)")
                    continue
                }

                if endDate < startDate {
                    endDate = Calendar.gregorian.date(byAdding: .year, value: 1, to: endDate)!
                }

                let totalDays = Calendar.gregorian.dateComponents(
                    [.day],
                    from: startDate,
                    to: endDate
                ).day ?? 0
                let midOffset = totalDays / 2

                guard let midDate = Calendar.gregorian.date(
                    byAdding: .day,
                    value: midOffset,
                    to: startDate
                ) else {
                    XCTFail("Could not calculate mid date for \(zodiac.sign) in \(label)")
                    continue
                }

                let result = try service.getWesternZodiac(from: midDate)
                XCTAssertEqual(
                    result,
                    zodiac.sign,
                    "\(label): Expected \(zodiac.sign) for middle date of its range"
                )
            }
        }
    }
}
