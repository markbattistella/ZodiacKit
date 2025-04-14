//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// A protocol that defines the metadata associated with a zodiac sign.
///
/// Conforming types provide descriptive properties such as symbolism, traits, compatibility, and
/// astronomical associations. This protocol supports both Western and Chinese zodiac systems
/// through a shared contract.
internal protocol ZodiacMetadataRepresentable: RawRepresentable, CaseIterable, Codable, Hashable where RawValue == String {

    static var metadataMap: [Self: ZodiacMetadata<Self>] { get }

    // MARK: - Display

    /// The human-readable name of the zodiac sign.
    var name: String { get }

    /// An emoji representing the sign (e.g. "♌", "🐉").
    var emoji: String { get }

    // MARK: - Elemental Attributes

    /// The classical element associated with the sign (e.g. Fire, Earth).
    var element: String { get }

    /// An emoji representation of the element (e.g. "🔥", "🌎").
    var elementEmoji: String { get }

    // MARK: - Traits

    /// General characteristics commonly associated with the sign.
    var characteristics: [String] { get }

    /// Primary strengths of the sign.
    var strengths: [String] { get }

    /// Common weaknesses or challenges for the sign.
    var weaknesses: [String] { get }

    /// A distilled list of key traits that define the sign.
    var keyTraits: [String] { get }

    // MARK: - Aesthetic

    /// The primary color associated with the sign, expressed as a hex string (e.g. `#FF5733`).
    var colorHEX: String { get }

    // MARK: - Astrological Properties

    /// The modern ruling planet of the sign (e.g. Mars, Mercury).
    var rulingPlanetName: String { get }

    /// The traditional ruling planet, if different from the modern one.
    var traditionalRulingPlanetName: String? { get }

    /// The astronomical symbol of the ruling planet (e.g. "♄", "♀").
    var rulingPlanetSymbol: String { get }

    /// The modality of the sign (e.g. Cardinal, Fixed, Mutable).
    var modality: String { get }

    /// The polarity of the sign (e.g. Positive, Negative).
    var polarity: String { get }

    /// The astrological house associated with the sign (e.g. "6th House").
    var rulingHouse: String { get }

    /// The brightest or most notable star in the constellation of the sign.
    var brightestStar: String { get }

    /// The Yin or Yang classification of the sign.
    var yinYang: String { get }

    /// The season most strongly associated with the sign (e.g. "Spring").
    var season: String { get }

    // MARK: - Symbolism

    /// A symbolic name or totem of the sign (e.g. "Scorpion", "Tiger").
    var symbol: String { get }

    /// An emoji representing the symbol (e.g. "🦂", "🐅").
    var symbolEmoji: String { get }

    /// The gemstone traditionally associated with the sign.
    var birthstone: String { get }

    // MARK: - Compatibility

    /// Compatibility information describing how this sign interacts with others.
    //    var compatibilityInfo: CompatibilityInfo<Self> { get }

    /// Signs that are considered the most naturally compatible.
    var bestMatches: [Self] { get }

    /// Signs that have average or neutral compatibility.
    var averageMatches: [Self] { get }

    /// Signs that may have conflict or tension, but are not inherently harmful.
    var conflictingMatches: [Self] { get }

    /// Signs that tend to have strong incompatibility or disharmony.
    var harmfulMatches: [Self] { get }
}

extension ZodiacMetadataRepresentable {

    /// Provides detailed metadata for the zodiac sign.
    internal var metadata: ZodiacMetadata<Self> {
        Self.metadataMap[self]!
    }
}
