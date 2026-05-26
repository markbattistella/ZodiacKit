//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Testing
import ZodiacKit

@Suite("Public API")
struct PublicAPITests {

  @Test("Consumers can create custom zodiac definitions")
  func consumersCanCreateCustomZodiacDefinitions() {
    let zodiac = Zodiac(
      sign: .capricorn,
      start: .init(day: 1, month: 1),
      end: .init(day: 31, month: 1)
    )

    #expect(zodiac.sign == .capricorn)
    #expect(zodiac.start == .init(day: 1, month: 1))
    #expect(zodiac.end == .init(day: 31, month: 1))
  }
}
