//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

extension ZodiacPresets {

    /// An equal-length system that divides the zodiac wheel into 14 signs of uniform duration.
    ///
    /// Useful for abstracted or balanced representations.
    /// - Important: Includes Ophiuchus and Cetus.
    public static var equalLength: [Zodiac] {[
        .init(sign: .aries, start: .init(day: 16, month: 4), end: .init(day: 11, month: 5)),
        .init(sign: .cetus, start: .init(day: 12, month: 5), end: .init(day: 6, month: 6)),
        .init(sign: .taurus, start: .init(day: 7, month: 6), end: .init(day: 2, month: 7)),
        .init(sign: .gemini, start: .init(day: 3, month: 7), end: .init(day: 28, month: 7)),
        .init(sign: .cancer, start: .init(day: 29, month: 7), end: .init(day: 23, month: 8)),
        .init(sign: .leo, start: .init(day: 24, month: 8), end: .init(day: 18, month: 9)),
        .init(sign: .virgo, start: .init(day: 19, month: 9), end: .init(day: 14, month: 10)),
        .init(sign: .libra, start: .init(day: 15, month: 10), end: .init(day: 9, month: 11)),
        .init(sign: .scorpio, start: .init(day: 10, month: 11), end: .init(day: 5, month: 12)),
        .init(sign: .ophiuchus, start: .init(day: 6, month: 12), end: .init(day: 31, month: 12)),
        .init(sign: .sagittarius, start: .init(day: 1, month: 1), end: .init(day: 26, month: 1)),
        .init(sign: .capricorn, start: .init(day: 27, month: 1), end: .init(day: 21, month: 2)),
        .init(sign: .aquarius, start: .init(day: 22, month: 2), end: .init(day: 20, month: 3)),
        .init(sign: .pisces, start: .init(day: 21, month: 3), end: .init(day: 15, month: 4))
    ]}
}
