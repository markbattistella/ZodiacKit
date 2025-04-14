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
internal struct ZodiacMetadata<M: ZodiacMetadataRepresentable> {

    /// The emoji representing the zodiac sign (e.g. "♈️", "🐉").
    let emoji: String

    /// The classical element associated with the sign (e.g. Fire, Water).
    let element: String

    /// An emoji representing the element (e.g. "🔥", "💧").
    let elementEmoji: String

    /// The modality of the sign (e.g. Cardinal, Fixed, Mutable).
    let modality: String

    /// The polarity of the sign (e.g. Positive/Negative, Yin/Yang).
    let polarity: String

    /// The Yin or Yang classification of the sign.
    let yinYang: String

    /// The name of the ruling planet.
    let rulingPlanetName: String

    /// The traditional ruling planet, if different from the modern one.
    let traditionalRulingPlanetName: String?

    /// The astronomical symbol of the ruling planet (e.g. "♄" for Saturn).
    let rulingPlanetSymbol: String

    /// The astrological house associated with the sign.
    let rulingHouse: String

    /// The primary color associated with the sign, as a hex string.
    let colorHEX: String

    /// The symbolic representation of the sign (e.g. "Ram", "Tiger").
    let symbol: String

    /// An emoji representing the symbol (e.g. "🐏", "🐅").
    let symbolEmoji: String

    /// The birthstone commonly associated with the sign.
    let birthstone: String

    /// The season most strongly associated with the sign.
    let season: String

    /// The brightest star or notable celestial body in the sign's constellation.
    let brightestStar: String

    /// A general set of personality characteristics associated with the sign.
    let characteristics: [String]

    /// Positive traits often attributed to this sign.
    let strengths: [String]

    /// Common weaknesses or challenges related to this sign.
    let weaknesses: [String]

    /// Key traits that best define the essence of the sign.
    let keyTraits: [String]

    /// Compatibility information for this sign with others.
    let compatibilityInfo: CompatibilityInfo<M>
}

/// A structure that describes zodiac sign compatibility.
///
/// Defines relationships between one sign and others across various levels of alignment.
internal struct CompatibilityInfo<M: ZodiacMetadataRepresentable>: Codable, Hashable {

    /// Signs that are considered the most naturally compatible.
    let bestMatches: Set<M>

    /// Signs that have average or neutral compatibility.
    let averageMatches: Set<M>

    /// Signs that may have conflict or tension, but are not inherently harmful.
    let conflictingMatches: Set<M>

    /// Signs that tend to have strong incompatibility or disharmony.
    let harmfulMatches: Set<M>
}
