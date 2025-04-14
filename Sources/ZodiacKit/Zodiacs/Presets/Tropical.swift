//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

extension ZodiacPresets {

    /// The traditional tropical zodiac system, based on the seasons and the Earth's position
    /// relative to the Sun.
    ///
    /// This is the most widely used system in Western astrology. Fixed date ranges based on
    /// equinoxes and solstices.
    public static var tropical: [Zodiac] {[
        .init(sign: .aries, start: .init(day: 21, month: 3), end: .init(day: 19, month: 4)),
        .init(sign: .taurus, start: .init(day: 20, month: 4), end: .init(day: 20, month: 5)),
        .init(sign: .gemini, start: .init(day: 21, month: 5), end: .init(day: 20, month: 6)),
        .init(sign: .cancer, start: .init(day: 21, month: 6), end: .init(day: 22, month: 7)),
        .init(sign: .leo, start: .init(day: 23, month: 7), end: .init(day: 22, month: 8)),
        .init(sign: .virgo, start: .init(day: 23, month: 8), end: .init(day: 22, month: 9)),
        .init(sign: .libra, start: .init(day: 23, month: 9), end: .init(day: 22, month: 10)),
        .init(sign: .scorpio, start: .init(day: 23, month: 10), end: .init(day: 21, month: 11)),
        .init(sign: .sagittarius,start: .init(day: 22, month: 11), end: .init(day: 21, month: 12)),
        .init(sign: .capricorn, start: .init(day: 22, month: 12), end: .init(day: 19, month: 1)),
        .init(sign: .aquarius, start: .init(day: 20, month: 1), end: .init(day: 18, month: 2)),
        .init(sign: .pisces, start: .init(day: 19, month: 2), end: .init(day: 20, month: 3))
    ]}
}
