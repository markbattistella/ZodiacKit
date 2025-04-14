//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// Represents the 12 animals of the Chinese Zodiac.
public enum Chinese: String, ZodiacSign {
    case dog, dragon, goat, horse, monkey, ox,
         pig, rabbit, rat, rooster, snake, tiger

    public static var allCases: [Chinese] {
        [.rat, .ox, .tiger, .rabbit, .dragon, .snake,
         .horse, .goat, .monkey, .rooster, .dog, .pig]
    }
}

extension Chinese: ZodiacMetadataRepresentable {

    /// The capitalised name of the zodiac sign (e.g., "Rat").
    public var name: String { rawValue.capitalized }

    /// The emoji representation of the zodiac animal (e.g., 🐀).
    public var emoji: String { metadata.emoji }

    /// The classical element (e.g., Fire, Water).
    public var element: String { metadata.element }

    /// An emoji symbol for the element (e.g., 🔥).
    public var elementEmoji: String { metadata.elementEmoji }

    /// Descriptive personality traits associated with the sign.
    public var characteristics: [String] { metadata.characteristics }

    /// The primary color associated with the sign in hexadecimal format.
    public var colorHEX: String { metadata.colorHEX }

    /// A platform-agnostic color representation (UIColor or NSColor).
    public var color: AgnosticColor { .init(hex: colorHEX) ?? .clear }

    /// The name of the ruling planet.
    public var rulingPlanetName: String { metadata.rulingPlanetName }

    /// An optional traditional ruling planet name.
    public var traditionalRulingPlanetName: String? { metadata.traditionalRulingPlanetName }

    /// The planetary symbol (e.g., ♃ for Jupiter).
    public var rulingPlanetSymbol: String { metadata.rulingPlanetSymbol }

    /// Represents energetic patterning (e.g., Yin or Yang).
    public var modality: String { metadata.modality }

    /// The polarity classification (Positive or Negative).
    public var polarity: String { metadata.polarity }

    /// The associated directional or seasonal house.
    public var rulingHouse: String { metadata.rulingHouse }

    /// The brightest star linked with this sign.
    public var brightestStar: String { metadata.brightestStar }

    /// The Yin or Yang classification.
    public var yinYang: String { metadata.yinYang }

    /// The seasonal association of the sign.
    public var season: String { metadata.season }

    /// The symbolic name of the animal (e.g., "Snake").
    public var symbol: String { metadata.symbol }

    /// The emoji representation of the symbol (e.g., 🐍).
    public var symbolEmoji: String { metadata.symbolEmoji }

    /// The associated birthstone (may be empty if not specified).
    public var birthstone: String { metadata.birthstone }

    /// Positive qualities typically attributed to this sign.
    public var strengths: [String] { metadata.strengths }

    /// Common challenges or flaws associated with the sign.
    public var weaknesses: [String] { metadata.weaknesses }

    /// Key summarised traits (useful for UI or quick reference).
    public var keyTraits: [String] { metadata.keyTraits }

    /// Signs that are considered the most naturally compatible.
    public var bestMatches: [Chinese] { Array(metadata.compatibilityInfo.bestMatches) }

    /// Signs that have average or neutral compatibility.
    public var averageMatches: [Chinese] { Array(metadata.compatibilityInfo.averageMatches) }

    /// Signs that may have conflict or tension, but are not inherently harmful.
    public var conflictingMatches: [Chinese] { Array(metadata.compatibilityInfo.conflictingMatches) }

    /// Signs that tend to have strong incompatibility or disharmony.
    public var harmfulMatches: [Chinese] { Array(metadata.compatibilityInfo.harmfulMatches) }
}

// MARK: - Metadata Mapping

extension Chinese {

    /// A static mapping of all Chinese zodiac signs to their full metadata descriptions.
    ///
    /// This dictionary is used internally to power the `ZodiacMetadataRepresentable` conformance.
    internal static var metadataMap: [Chinese: ZodiacMetadata<Chinese>] {[
        .rat: ZodiacMetadata(
            emoji: "🐀",
            element: "Water",
            elementEmoji: "💧",
            modality: "Yang",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Mercury",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "☿",
            rulingHouse: "North",
            colorHEX: "#7D9D9C",
            symbol: "Rat",
            symbolEmoji: "🐀",
            birthstone: "",
            season: "Winter",
            brightestStar: "Sirius",
            characteristics: [
                "Quick-witted",
                "Resourceful",
                "Versatile",
                "Kind",
                "Smart",
                "Adaptable"
            ],
            strengths: [
                "Adaptable",
                "Intelligent",
                "Alert",
                "Positive",
                "Flexible"
            ],
            weaknesses: [
                "Timid",
                "Stubborn",
                "Picky",
                "Gossipy",
                "Opportunistic"
            ],
            keyTraits: [
                "Clever",
                "Careful",
                "Diligent"
            ],
            compatibilityInfo: compatibilityInfo[.rat]!
        ),
        .ox: ZodiacMetadata(
            emoji: "🐂",
            element: "Earth",
            elementEmoji: "🌎",
            modality: "Yin",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Saturn",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♄",
            rulingHouse: "North-Northeast",
            colorHEX: "#2B4865",
            symbol: "Ox",
            symbolEmoji: "🐂",
            birthstone: "",
            season: "Winter",
            brightestStar: "Aldebaran",
            characteristics: [
                "Diligent",
                "Dependable",
                "Strong",
                "Determined",
                "Honest",
                "Patient"
            ],
            strengths: [
                "Patient",
                "Hardworking",
                "Trustworthy",
                "Reliable",
                "Methodical"
            ],
            weaknesses: [
                "Stubborn",
                "Conventional",
                "Inflexible",
                "Judgmental",
                "Demanding"
            ],
            keyTraits: [
                "Reliable",
                "Strong",
                "Conservative"
            ],
            compatibilityInfo: compatibilityInfo[.ox]!
        ),
        .tiger: ZodiacMetadata(
            emoji: "🐅",
            element: "Wood",
            elementEmoji: "🌳",
            modality: "Yang",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Mars",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♂",
            rulingHouse: "Northeast",
            colorHEX: "#F29727",
            symbol: "Tiger",
            symbolEmoji: "🐅",
            birthstone: "",
            season: "Winter",
            brightestStar: "Regulus",
            characteristics: [
                "Brave",
                "Confident",
                "Competitive",
                "Unpredictable",
                "Charming",
                "Intense"
            ],
            strengths: [
                "Courageous",
                "Enthusiastic",
                "Confident",
                "Charismatic",
                "Leader"
            ],
            weaknesses: [
                "Impulsive",
                "Rebellious",
                "Short-tempered",
                "Overconfident",
                "Suspicious"
            ],
            keyTraits: [
                "Brave",
                "Confident",
                "Competitive"
            ],
            compatibilityInfo: compatibilityInfo[.tiger]!
        ),
        .rabbit: ZodiacMetadata(
            emoji: "🐇",
            element: "Wood",
            elementEmoji: "🌳",
            modality: "Yin",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Venus",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♀",
            rulingHouse: "East",
            colorHEX: "#F2BED1",
            symbol: "Rabbit",
            symbolEmoji: "🐇",
            birthstone: "",
            season: "Spring",
            brightestStar: "Vega",
            characteristics: [
                "Gentle",
                "Quiet",
                "Elegant",
                "Alert",
                "Quick",
                "Skillful"
            ],
            strengths: [
                "Gentle",
                "Compassionate",
                "Elegant",
                "Artistic",
                "Diplomatic"
            ],
            weaknesses: [
                "Timid",
                "Superficial",
                "Detached",
                "Self-indulgent",
                "Overly cautious"
            ],
            keyTraits: [
                "Quiet",
                "Elegant",
                "Kind"
            ],
            compatibilityInfo: compatibilityInfo[.rabbit]!
        ),
        .dragon: ZodiacMetadata(
            emoji: "🐉",
            element: "Earth",
            elementEmoji: "🌎",
            modality: "Yang",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Jupiter",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♃",
            rulingHouse: "East-Southeast",
            colorHEX: "#E94560",
            symbol: "Dragon",
            symbolEmoji: "🐉",
            birthstone: "",
            season: "Spring",
            brightestStar: "Alpha Draconis",
            characteristics: [
                "Confident",
                "Intelligent",
                "Enthusiastic",
                "Ambitious",
                "Romantic",
                "Passionate"
            ],
            strengths: [
                "Confident",
                "Ambitious",
                "Intelligent",
                "Energetic",
                "Charismatic"
            ],
            weaknesses: [
                "Arrogant",
                "Impulsive",
                "Unrealistic",
                "Domineering",
                "Inflexible"
            ],
            keyTraits: [
                "Powerful",
                "Ambitious",
                "Lucky"
            ],
            compatibilityInfo: compatibilityInfo[.dragon]!
        ),
        .snake: ZodiacMetadata(
            emoji: "🐍",
            element: "Fire",
            elementEmoji: "🔥",
            modality: "Yin",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Pluto",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♇",
            rulingHouse: "Southeast",
            colorHEX: "#557153",
            symbol: "Snake",
            symbolEmoji: "🐍",
            birthstone: "",
            season: "Spring",
            brightestStar: "Serpens",
            characteristics: [
                "Enigmatic",
                "Intuitive",
                "Wise",
                "Determined",
                "Refined",
                "Analytical"
            ],
            strengths: [
                "Wise",
                "Intuitive",
                "Elegant",
                "Determined",
                "Mysterious"
            ],
            weaknesses: [
                "Jealous",
                "Suspicious",
                "Possessive",
                "Manipulative",
                "Materialistic"
            ],
            keyTraits: [
                "Wise",
                "Mysterious",
                "Charming"
            ],
            compatibilityInfo: compatibilityInfo[.snake]!
        ),
        .horse: ZodiacMetadata(
            emoji: "🐎",
            element: "Fire",
            elementEmoji: "🔥",
            modality: "Yang",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Mars",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♂",
            rulingHouse: "South",
            colorHEX: "#C63D2F",
            symbol: "Horse",
            symbolEmoji: "🐎",
            birthstone: "",
            season: "Summer",
            brightestStar: "Kitalpha",
            characteristics: [
                "Energetic",
                "Independent",
                "Warm-hearted",
                "Enthusiastic",
                "Free-spirited",
                "Positive"
            ],
            strengths: [
                "Energetic",
                "Independent",
                "Adventurous",
                "Warm-hearted",
                "Versatile"
            ],
            weaknesses: [
                "Impatient",
                "Impulsive",
                "Stubborn",
                "Self-centered",
                "Rebellious"
            ],
            keyTraits: [
                "Energetic",
                "Independent",
                "Adventurous"
            ],
            compatibilityInfo: compatibilityInfo[.horse]!
        ),
        .goat: ZodiacMetadata(
            emoji: "🐐",
            element: "Earth",
            elementEmoji: "🌎",
            modality: "Yin",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Neptune",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♆",
            rulingHouse: "Southwest",
            colorHEX: "#F0E5CF",
            symbol: "Goat",
            symbolEmoji: "🐐",
            birthstone: "",
            season: "Summer",
            brightestStar: "Capella",
            characteristics: [
                "Gentle",
                "Empathetic",
                "Creative",
                "Calm",
                "Artistic",
                "Elegant"
            ],
            strengths: [
                "Gentle",
                "Creative",
                "Compassionate",
                "Artistic",
                "Peaceful"
            ],
            weaknesses: [
                "Indecisive",
                "Timid",
                "Pessimistic",
                "Dependent",
                "Worrisome"
            ],
            keyTraits: [
                "Gentle",
                "Creative",
                "Compassionate"
            ],
            compatibilityInfo: compatibilityInfo[.goat]!
        ),
        .monkey: ZodiacMetadata(
            emoji: "🐒",
            element: "Metal",
            elementEmoji: "🔧",
            modality: "Yang",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Mercury",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "☿",
            rulingHouse: "West-Southwest",
            colorHEX: "#FCAF3C",
            symbol: "Monkey",
            symbolEmoji: "🐒",
            birthstone: "",
            season: "Summer",
            brightestStar: "Arcturus",
            characteristics: [
                "Intelligent",
                "Witty",
                "Flexible",
                "Innovative",
                "Problem solver",
                "Mischievous"
            ],
            strengths: [
                "Intelligent",
                "Creative",
                "Versatile",
                "Witty",
                "Adaptable"
            ],
            weaknesses: [
                "Dishonest",
                "Impulsive",
                "Opportunistic",
                "Vain",
                "Manipulative"
            ],
            keyTraits: [
                "Clever",
                "Versatile",
                "Quick-witted"
            ],
            compatibilityInfo: compatibilityInfo[.monkey]!
        ),
        .rooster: ZodiacMetadata(
            emoji: "🐓",
            element: "Metal",
            elementEmoji: "🔧",
            modality: "Yin",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Venus",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♀",
            rulingHouse: "West",
            colorHEX: "#FA7070",
            symbol: "Rooster",
            symbolEmoji: "🐓",
            birthstone: "",
            season: "Autumn",
            brightestStar: "Spica",
            characteristics: [
                "Observant",
                "Hardworking",
                "Courageous",
                "Talented",
                "Confident",
                "Honest"
            ],
            strengths: [
                "Honest",
                "Observant",
                "Practical",
                "Organized",
                "Confident"
            ],
            weaknesses: [
                "Critical",
                "Perfectionist",
                "Blunt",
                "Conservative",
                "Arrogant"
            ],
            keyTraits: [
                "Observant",
                "Hardworking",
                "Courageous"
            ],
            compatibilityInfo: compatibilityInfo[.rooster]!
        ),
        .dog: ZodiacMetadata(
            emoji: "🐕",
            element: "Earth",
            elementEmoji: "🌎",
            modality: "Yang",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Pluto",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♇",
            rulingHouse: "West-Northwest",
            colorHEX: "#C4DFAA",
            symbol: "Dog",
            symbolEmoji: "🐕",
            birthstone: "",
            season: "Autumn",
            brightestStar: "Sirius",
            characteristics: [
                "Loyal",
                "Honest",
                "Responsible",
                "Courageous",
                "Sincere",
                "Protective"
            ],
            strengths: [
                "Loyal",
                "Honest",
                "Responsible",
                "Brave",
                "Protective"
            ],
            weaknesses: [
                "Anxious",
                "Conservative",
                "Stubborn",
                "Critical",
                "Pessimistic"
            ],
            keyTraits: [
                "Loyal",
                "Honest",
                "Protective"
            ],
            compatibilityInfo: compatibilityInfo[.dog]!
        ),
        .pig: ZodiacMetadata(
            emoji: "🐖",
            element: "Water",
            elementEmoji: "💧",
            modality: "Yin",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Jupiter",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♃",
            rulingHouse: "Northwest",
            colorHEX: "#CB1C8D",
            symbol: "Pig",
            symbolEmoji: "🐖",
            birthstone: "",
            season: "Winter",
            brightestStar: "Alderamin",
            characteristics: [
                "Compassionate",
                "Generous",
                "Diligent",
                "Peace-loving",
                "Honest",
                "Optimistic"
            ],
            strengths: [
                "Kind",
                "Generous",
                "Diligent",
                "Honest",
                "Brave"
            ],
            weaknesses: [
                "Naive",
                "Over-reliant",
                "Self-indulgent",
                "Materialistic",
                "Gullible"
            ],
            keyTraits: [
                "Kind",
                "Wealth-oriented",
                "Honest"
            ],
            compatibilityInfo: compatibilityInfo[.pig]!
        ),
    ]}
}

// MARK: - Compatibility Info

extension Chinese {

    /// Defines zodiac compatibility rules for each Chinese sign.
    ///
    /// Compatibility is categorised as:
    /// - `bestMatches`: Ideal pairings
    /// - `averageMatches`: Neutral or balanced pairings
    /// - `conflictingMatches`: Challenging but not harmful
    /// - `harmfulMatches`: Traditionally unlucky or unstable pairings
    internal static var compatibilityInfo: [Chinese: CompatibilityInfo<Chinese>] {[
        .rat: CompatibilityInfo(
            bestMatches: [.dragon, .monkey, .ox],
            averageMatches: [.tiger, .snake, .rooster],
            conflictingMatches: [.rabbit, .goat],
            harmfulMatches: [.horse]
        ),
        .ox: CompatibilityInfo(
            bestMatches: [.rat, .snake, .rooster],
            averageMatches: [.tiger, .monkey, .pig],
            conflictingMatches: [.dragon, .horse],
            harmfulMatches: [.goat]
        ),
        .tiger: CompatibilityInfo(
            bestMatches: [.horse, .dog, .pig],
            averageMatches: [.rat, .rabbit, .dragon],
            conflictingMatches: [.monkey, .snake],
            harmfulMatches: [.ox]
        ),
        .rabbit: CompatibilityInfo(
            bestMatches: [.goat, .dog, .pig],
            averageMatches: [.tiger, .horse, .monkey],
            conflictingMatches: [.rat, .dragon],
            harmfulMatches: [.rooster]
        ),
        .dragon: CompatibilityInfo(
            bestMatches: [.rat, .monkey, .rooster],
            averageMatches: [.tiger, .snake, .pig],
            conflictingMatches: [.ox, .rabbit],
            harmfulMatches: [.dog]
        ),
        .snake: CompatibilityInfo(
            bestMatches: [.ox, .rooster, .monkey],
            averageMatches: [.dragon, .goat, .dog],
            conflictingMatches: [.tiger, .rabbit],
            harmfulMatches: [.pig]
        ),
        .horse: CompatibilityInfo(
            bestMatches: [.tiger, .goat, .dog],
            averageMatches: [.rabbit, .monkey, .pig],
            conflictingMatches: [.ox, .rooster],
            harmfulMatches: [.rat]
        ),
        .goat: CompatibilityInfo(
            bestMatches: [.rabbit, .horse, .pig],
            averageMatches: [.snake, .monkey, .dog],
            conflictingMatches: [.rat, .ox],
            harmfulMatches: [.rooster]
        ),
        .monkey: CompatibilityInfo(
            bestMatches: [.rat, .dragon, .snake],
            averageMatches: [.ox, .rabbit, .goat],
            conflictingMatches: [.tiger, .pig],
            harmfulMatches: [.horse]
        ),
        .rooster: CompatibilityInfo(
            bestMatches: [.ox, .dragon, .snake],
            averageMatches: [.rat, .tiger, .dog],
            conflictingMatches: [.horse, .rabbit],
            harmfulMatches: [.goat]
        ),
        .dog: CompatibilityInfo(
            bestMatches: [.tiger, .rabbit, .horse],
            averageMatches: [.rooster, .goat, .snake],
            conflictingMatches: [.ox, .monkey],
            harmfulMatches: [.dragon]
        ),
        .pig: CompatibilityInfo(
            bestMatches: [.tiger, .rabbit, .goat],
            averageMatches: [.ox, .dragon, .horse],
            conflictingMatches: [.monkey, .snake],
            harmfulMatches: [.rooster]
        ),
    ]}
}
