//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

extension ZodiacPresets {

    /// The sidereal system aligns sign boundaries with current positions of constellations.
    ///
    /// Common in Eastern astrology (e.g., Vedic) and reflects the true astronomical sky due to
    /// precession.
    /// - Important: Includes 12 signs, no Ophiuchus.
    public static var sidereal: [Zodiac] {[
        .init(sign: .aries, start: .init(day: 14, month: 4), end: .init(day: 14, month: 5)),
        .init(sign: .taurus, start: .init(day: 15, month: 5), end: .init(day: 15, month: 6)),
        .init(sign: .gemini, start: .init(day: 16, month: 6), end: .init(day: 16, month: 7)),
        .init(sign: .cancer, start: .init(day: 17, month: 7), end: .init(day: 16, month: 8)),
        .init(sign: .leo, start: .init(day: 17, month: 8), end: .init(day: 16, month: 9)),
        .init(sign: .virgo, start: .init(day: 17, month: 9), end: .init(day: 16, month: 10)),
        .init(sign: .libra, start: .init(day: 17, month: 10), end: .init(day: 15, month: 11)),
        .init(sign: .scorpio, start: .init(day: 16, month: 11), end: .init(day: 15, month: 12)),
        .init(sign: .sagittarius,start: .init(day: 16, month: 12), end: .init(day: 14, month: 1)),
        .init(sign: .capricorn, start: .init(day: 15, month: 1), end: .init(day: 12, month: 2)),
        .init(sign: .aquarius, start: .init(day: 13, month: 2), end: .init(day: 14, month: 3)),
        .init(sign: .pisces, start: .init(day: 15, month: 3), end: .init(day: 13, month: 4))
    ]}
}
