//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// Metadata that describes the traits and attributes of a zodiac sign.
///
/// This includes symbolic information, personality traits, elemental associations, and
/// compatibility with other signs.
public struct ZodiacOverview {

    /// The zodiac name.
    public let name: String

    /// The emoji representing the zodiac sign (e.g. "♈️", "🐉").
    public let emoji: String

    /// The classical element associated with the sign (e.g. Fire, Water).
    public let element: String

    /// An emoji representing the element (e.g. "🔥", "💧").
    public let elementEmoji: String
    
    /// The modality of the sign (e.g. Cardinal, Fixed, Mutable).
    public let modality: String

    /// The polarity of the sign (e.g. Positive/Negative, Yin/Yang).
    public let polarity: String

    /// The Yin or Yang classification of the sign.
    public let yinYang: String

    /// The name of the ruling planet.
    public let rulingPlanetName: String

    /// The traditional ruling planet, if different from the modern one.
    public let traditionalRulingPlanetName: String?

    /// The astronomical symbol of the ruling planet (e.g. "♄" for Saturn).
    public let rulingPlanetSymbol: String

    /// The astrological house associated with the sign.
    public let rulingHouse: String

    /// The primary color associated with the sign, as a hex string.
    public let colorHEX: String

    /// The symbolic representation of the sign (e.g. "Ram", "Tiger").
    public let symbol: String

    /// An emoji representing the symbol (e.g. "🐏", "🐅").
    public let symbolEmoji: String

    /// The birthstone commonly associated with the sign.
    public let birthstone: String

    /// The season most strongly associated with the sign.
    public let season: String

    /// The brightest star or notable celestial body in the sign's constellation.
    public let brightestStar: String

    /// A general set of personality characteristics associated with the sign.
    public let characteristics: [String]

    /// Positive traits often attributed to this sign.
    public let strengths: [String]

    /// Common weaknesses or challenges related to this sign.
    public let weaknesses: [String]

    /// Key traits that best define the essence of the sign.
    public let keyTraits: [String]
}
