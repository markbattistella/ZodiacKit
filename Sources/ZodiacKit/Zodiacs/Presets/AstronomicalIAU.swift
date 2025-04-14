//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

extension ZodiacPresets {

    /// The astronomical IAU system, based on actual constellation boundaries defined by the
    /// International Astronomical Union.
    ///
    /// Includes 13 signs, with Ophiuchus positioned between Scorpio and Sagittarius. Date ranges
    /// reflect the real span of constellations in the sky.
    public static var astronomicalIAU: [Zodiac] {[
        .init(sign: .aries, start: .init(day: 19, month: 4), end: .init(day: 13, month: 5)),
        .init(sign: .taurus, start: .init(day: 14, month: 5), end: .init(day: 21, month: 6)),
        .init(sign: .gemini, start: .init(day: 22, month: 6), end: .init(day: 20, month: 7)),
        .init(sign: .cancer, start: .init(day: 21, month: 7), end: .init(day: 10, month: 8)),
        .init(sign: .leo, start: .init(day: 11, month: 8), end: .init(day: 16, month: 9)),
        .init(sign: .virgo, start: .init(day: 17, month: 9), end: .init(day: 30, month: 10)),
        .init(sign: .libra, start: .init(day: 31, month: 10), end: .init(day: 23, month: 11)),
        .init(sign: .scorpio, start: .init(day: 24, month: 11), end: .init(day: 29, month: 11)),
        .init(sign: .ophiuchus, start: .init(day: 30, month: 11), end: .init(day: 17, month: 12)),
        .init(sign: .sagittarius, start: .init(day: 18, month: 12), end: .init(day: 20, month: 1)),
        .init(sign: .capricorn, start: .init(day: 21, month: 1), end: .init(day: 16, month: 2)),
        .init(sign: .aquarius, start: .init(day: 17, month: 2), end: .init(day: 11, month: 3)),
        .init(sign: .pisces, start: .init(day: 12, month: 3), end: .init(day: 18, month: 4))
    ]}
}
