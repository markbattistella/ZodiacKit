//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation
import Testing

@testable import ZodiacKit

@Suite("Utility behavior")
struct UtilityTests {

  @Test("Date construction rejects normalized invalid components")
  func strictDateConstructionRejectsInvalidComponents() {
    #expect(Date.from(day: 29, month: 2, year: 2000) != nil)
    #expect(Date.from(day: 30, month: 2, year: 2000) == nil)
    #expect(Date.from(day: 1, month: 13, year: 2000) == nil)
    #expect(Date.from(day: 0, month: 1, year: 2000) == nil)
  }

  @Test("Zodiac days reject invalid calendar dates")
  func zodiacDayRejectsInvalidCalendarDates() {
    #expect {
      try Zodiac.ZodiacDay(day: 30, month: 2).toDate()
    } throws: { error in
      guard case ZodiacError.couldNotConstructLeapDate(month: 2, day: 30) = error else {
        return false
      }
      return true
    }
  }

  @Test("Hex colors parse RRGGBBAA alpha order")
  func hexColorsParseRRGGBBAAAlphaOrder() throws {
    let parsedColor = try #require(HexColorParser(hex: "#FF000080"))

    #expect(parsedColor.red == 1.0)
    #expect(parsedColor.green == 0.0)
    #expect(parsedColor.blue == 0.0)
    #expect(abs(parsedColor.alpha - (128.0 / 255.0)) < 0.0001)
  }

  @Test("Short hex colors parse RGBA alpha order")
  func shortHexColorsParseRGBAAlphaOrder() throws {
    let parsedColor = try #require(HexColorParser(hex: "#0F08"))

    #expect(parsedColor.red == 0.0)
    #expect(parsedColor.green == 1.0)
    #expect(parsedColor.blue == 0.0)
    #expect(abs(parsedColor.alpha - (136.0 / 255.0)) < 0.0001)
  }

  @Test("Hex colors reject trailing non-hex characters")
  func hexColorsRejectTrailingNonHexCharacters() {
    #expect(HexColorParser(hex: "#FF0000ZZ") == nil)
  }
}

@MainActor
@Suite("Chinese zodiac lookup")
struct ChineseZodiacLookupTests {

  @Test("Chinese zodiac follows lunar new year boundary")
  func chineseZodiacFollowsLunarNewYearBoundary() throws {
    let service = ZodiacService()

    #expect(try service.getChineseZodiac(from: date(year: 2024, month: 2, day: 9)) == .rabbit)
    #expect(try service.getChineseZodiac(from: date(year: 2024, month: 2, day: 10)) == .dragon)
    #expect(try service.getChineseZodiac(from: date(year: 2025, month: 1, day: 28)) == .dragon)
    #expect(try service.getChineseZodiac(from: date(year: 2025, month: 1, day: 29)) == .snake)
  }

  private func date(year: Int, month: Int, day: Int) throws -> Date {
    try #require(Date.from(day: day, month: month, year: year))
  }
}
