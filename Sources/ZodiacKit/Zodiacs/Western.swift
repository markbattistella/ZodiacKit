//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

/// Represents the Western zodiac signs, including traditional and extended constellations.
///
/// Includes the 12 traditional signs, along with optionally recognised signs such as `ophiuchus`
/// and `cetus`.
public enum Western: String, ZodiacSign {

    /// The Aquarius sign.
    case aquarius

    /// The Aries sign.
    case aries

    /// The Cancer sign.
    case cancer

    /// The Capricorn sign.
    case capricorn

    /// The Gemini sign.
    case gemini

    /// The Leo sign.
    case leo

    /// The Libra sign.
    case libra

    /// The Pisces sign.
    case pisces

    /// The Sagittarius sign.
    case sagittarius

    /// The Scorpio sign.
    case scorpio

    /// The Taurus sign.
    case taurus

    /// The Virgo sign.
    case virgo

    /// The Ophiuchus sign — sometimes considered a "13th" zodiac sign in modern astrology.
    case ophiuchus

    /// The Cetus sign — an extremely rare and unofficial zodiac sign occasionally referenced in
    /// sidereal astrology.
    case cetus

    /// The 12 traditional zodiac signs, excluding `ophiuchus` and `cetus`.
    /// Used as the base for systems like the tropical and sidereal zodiacs.
    private static var traditionalCases: [Western] {
        allCases.filter { $0 != .ophiuchus && $0 != .cetus }
    }

    /// The tropical zodiac signs, commonly used in Western astrology.
    /// Matches the 12 traditional signs, excluding `ophiuchus` and `cetus`.
    public static var tropicalCases: [Western] { traditionalCases }

    /// The sidereal zodiac signs, based on constellations.
    /// Matches the 12 traditional signs, excluding `ophiuchus` and `cetus`.
    public static var siderealCases: [Western] { traditionalCases }

    /// An equal division of the ecliptic into 14 segments, including all signs.
    /// Includes `ophiuchus` and `cetus`.
    public static var equalLengthCases: [Western] { allCases }

    /// Zodiac signs recognized in the IAU (International Astronomical Union) model.
    /// Includes `ophiuchus` but excludes `cetus`, which is not officially part of the zodiac belt.
    public static var astronomicalIAUCases: [Western] {
        allCases.filter { $0 != .cetus }
    }
}

extension Western: ZodiacMetadataRepresentable {

    /// The capitalised name of the sign (e.g., "Aries").
    public var name: String { rawValue.capitalized }

    /// An emoji representing the astrological glyph or icon.
    public var emoji: String { metadata.emoji }

    /// The associated classical element (e.g., Fire, Earth).
    public var element: String { metadata.element }

    /// Emoji for the classical element (e.g., 🔥).
    public var elementEmoji: String { metadata.elementEmoji }

    /// Primary personality descriptors for the sign.
    public var characteristics: [String] { metadata.characteristics }

    /// The associated colour in HEX format.
    public var colorHEX: String { metadata.colorHEX }

    /// A platform-agnostic colour (UIColor / NSColor).
    public var color: AgnosticColor { .init(hex: colorHEX) ?? .clear }

    /// The ruling planet for the sign in modern astrology.
    public var rulingPlanetName: String { metadata.rulingPlanetName }

    /// The traditional ruling planet, if different from modern.
    public var traditionalRulingPlanetName: String? { metadata.traditionalRulingPlanetName }

    /// The planet's astronomical or astrological symbol.
    public var rulingPlanetSymbol: String { metadata.rulingPlanetSymbol }

    /// The modality (e.g., Cardinal, Fixed, Mutable).
    public var modality: String { metadata.modality }

    /// The astrological polarity (Positive or Negative).
    public var polarity: String { metadata.polarity }

    /// The associated astrological house (1st–12th).
    public var rulingHouse: String { metadata.rulingHouse }

    /// The brightest star associated with the sign's constellation.
    public var brightestStar: String { metadata.brightestStar }

    /// The Yin or Yang classification.
    public var yinYang: String { metadata.yinYang }

    /// The seasonal placement of the sign.
    public var season: String { metadata.season }

    /// The symbolic representation of the sign (e.g., "Ram").
    public var symbol: String { metadata.symbol }

    /// The emoji version of the symbol (e.g., 🐏).
    public var symbolEmoji: String { metadata.symbolEmoji }

    /// The birthstone traditionally linked with the sign.
    public var birthstone: String { metadata.birthstone }

    /// Positive qualities most strongly associated with the sign.
    public var strengths: [String] { metadata.strengths }

    /// Challenges or character flaws tied to the sign.
    public var weaknesses: [String] { metadata.weaknesses }

    /// Key summary traits often used in personality insights or horoscopes.
    public var keyTraits: [String] { metadata.keyTraits }

    /// Signs that are considered the most naturally compatible.
    public var bestMatches: [Western] { Array(metadata.compatibilityInfo.bestMatches) }

    /// Signs that have average or neutral compatibility.
    public var averageMatches: [Western] { Array(metadata.compatibilityInfo.averageMatches) }

    /// Signs that may have conflict or tension, but are not inherently harmful.
    public var conflictingMatches: [Western] { Array(metadata.compatibilityInfo.conflictingMatches) }

    /// Signs that tend to have strong incompatibility or disharmony.
    public var harmfulMatches: [Western] { Array(metadata.compatibilityInfo.harmfulMatches) }
}

// MARK: - Metadata Mapping

extension Western {

    /// A static mapping of all Western zodiac signs to their full metadata descriptions.
    ///
    /// This dictionary is used internally to power the `ZodiacMetadataRepresentable` conformance.
    internal static var metadataMap: [Western: ZodiacMetadata<Western>] {[
        .aquarius: ZodiacMetadata(
            emoji: "♒",
            element: "Air",
            elementEmoji: "💨",
            modality: "Fixed",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Uranus",
            traditionalRulingPlanetName: "Saturn",
            rulingPlanetSymbol: "♅",
            rulingHouse: "11th House",
            colorHEX: "#1CA9C9",
            symbol: "Water Bearer",
            symbolEmoji: "🏺",
            birthstone: "Amethyst",
            season: "Winter",
            brightestStar: "Sadalsuud",
            characteristics: [
                "Independent",
                "Original",
                "Humanitarian",
                "Intellectual",
                "Progressive",
                "Idealistic"
            ],
            strengths: [
                "Visionary",
                "Loyal",
                "Original",
                "Inventive",
                "Altruistic"
            ],
            weaknesses: [
                "Detached",
                "Stubborn",
                "Unpredictable",
                "Aloof",
                "Rebellious"
            ],
            keyTraits: [
                "Innovative",
                "Eccentric",
                "Humanitarian"
            ],
            compatibilityInfo: compatibilityInfo[.aquarius]!
        ),
        .pisces: ZodiacMetadata(
            emoji: "♓",
            element: "Water",
            elementEmoji: "💧",
            modality: "Mutable",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Neptune",
            traditionalRulingPlanetName: "Jupiter",
            rulingPlanetSymbol: "♆",
            rulingHouse: "12th House",
            colorHEX: "#7C9ED9",
            symbol: "Fish",
            symbolEmoji: "🐟",
            birthstone: "Aquamarine",
            season: "Winter/Spring Cusp",
            brightestStar: "Eta Piscium",
            characteristics: [
                "Compassionate",
                "Intuitive",
                "Dreamy",
                "Artistic",
                "Gentle",
                "Spiritual"
            ],
            strengths: [
                "Empathetic",
                "Creative",
                "Intuitive",
                "Adaptable",
                "Selfless"
            ],
            weaknesses: [
                "Escapist",
                "Idealistic",
                "Oversensitive",
                "Indecisive",
                "Victim mentality"
            ],
            keyTraits: [
                "Dreamy",
                "Mystical",
                "Empathetic"
            ],
            compatibilityInfo: compatibilityInfo[.pisces]!
        ),
        .aries: ZodiacMetadata(
            emoji: "♈",
            element: "Fire",
            elementEmoji: "🔥",
            modality: "Cardinal",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Mars",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♂",
            rulingHouse: "1st House",
            colorHEX: "#FF4136",
            symbol: "Ram",
            symbolEmoji: "🐏",
            birthstone: "Diamond",
            season: "Spring",
            brightestStar: "Hamal",
            characteristics: [
                "Courageous",
                "Energetic",
                "Confident",
                "Enthusiastic",
                "Direct",
                "Leader"
            ],
            strengths: [
                "Brave",
                "Determined",
                "Confident",
                "Enthusiastic",
                "Optimistic"
            ],
            weaknesses: [
                "Impatient",
                "Moody",
                "Impulsive",
                "Aggressive",
                "Short-tempered"
            ],
            keyTraits: [
                "Energetic",
                "Adventurous",
                "Pioneer"
            ],
            compatibilityInfo: compatibilityInfo[.aries]!
        ),
        .taurus: ZodiacMetadata(
            emoji: "♉",
            element: "Earth",
            elementEmoji: "🌎",
            modality: "Fixed",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Venus",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♀",
            rulingHouse: "2nd House",
            colorHEX: "#2ECC40",
            symbol: "Bull",
            symbolEmoji: "🐂",
            birthstone: "Emerald",
            season: "Spring",
            brightestStar: "Aldebaran",
            characteristics: [
                "Reliable",
                "Patient",
                "Practical",
                "Sensual",
                "Stubborn",
                "Devoted"
            ],
            strengths: [
                "Reliable",
                "Patient",
                "Practical",
                "Loyal",
                "Responsible"
            ],
            weaknesses: [
                "Stubborn",
                "Possessive",
                "Materialistic",
                "Self-indulgent",
                "Inflexible"
            ],
            keyTraits: [
                "Patient",
                "Reliable",
                "Sensual"
            ],
            compatibilityInfo: compatibilityInfo[.taurus]!
        ),
        .gemini: ZodiacMetadata(
            emoji: "♊",
            element: "Air",
            elementEmoji: "💨",
            modality: "Mutable",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Mercury",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "☿",
            rulingHouse: "3rd House",
            colorHEX: "#FFDC00",
            symbol: "Twins",
            symbolEmoji: "👯",
            birthstone: "Pearl",
            season: "Spring/Summer Cusp",
            brightestStar: "Pollux",
            characteristics: [
                "Versatile",
                "Curious",
                "Communicative",
                "Witty",
                "Adaptable",
                "Intellectual"
            ],
            strengths: [
                "Adaptable",
                "Outgoing",
                "Intelligent",
                "Eloquent",
                "Curious"
            ],
            weaknesses: [
                "Inconsistent",
                "Nervous",
                "Indecisive",
                "Superficial",
                "Restless"
            ],
            keyTraits: [
                "Communicative",
                "Curious",
                "Versatile"
            ],
            compatibilityInfo: compatibilityInfo[.gemini]!
        ),
        .cancer: ZodiacMetadata(
            emoji: "♋",
            element: "Water",
            elementEmoji: "💧",
            modality: "Cardinal",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Moon",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "☽",
            rulingHouse: "4th House",
            colorHEX: "#DDDDDD",
            symbol: "Crab",
            symbolEmoji: "🦀",
            birthstone: "Ruby",
            season: "Summer",
            brightestStar: "Al Tarf",
            characteristics: [
                "Nurturing",
                "Protective",
                "Intuitive",
                "Emotional",
                "Tenacious",
                "Sentimental"
            ],
            strengths: [
                "Loyal",
                "Emotional",
                "Sympathetic",
                "Protective",
                "Intuitive"
            ],
            weaknesses: [
                "Moody",
                "Overemotional",
                "Suspicious",
                "Manipulative",
                "Insecure"
            ],
            keyTraits: [
                "Nurturing",
                "Protective",
                "Intuitive"
            ],
            compatibilityInfo: compatibilityInfo[.cancer]!
        ),
        .leo: ZodiacMetadata(
            emoji: "♌",
            element: "Fire",
            elementEmoji: "🔥",
            modality: "Fixed",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Sun",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "☉",
            rulingHouse: "5th House",
            colorHEX: "#FF851B",
            symbol: "Lion",
            symbolEmoji: "🦁",
            birthstone: "Peridot",
            season: "Summer",
            brightestStar: "Regulus",
            characteristics: [
                "Generous",
                "Warm-hearted",
                "Creative",
                "Enthusiastic",
                "Dignified",
                "Charismatic"
            ],
            strengths: [
                "Confident",
                "Creative",
                "Generous",
                "Loyal",
                "Encouraging"
            ],
            weaknesses: [
                "Arrogant",
                "Stubborn",
                "Self-centered",
                "Domineering",
                "Melodramatic"
            ],
            keyTraits: [
                "Proud",
                "Charismatic",
                "Leader"
            ],
            compatibilityInfo: compatibilityInfo[.leo]!
        ),
        .virgo: ZodiacMetadata(
            emoji: "♍",
            element: "Earth",
            elementEmoji: "🌎",
            modality: "Mutable",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Mercury",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "☿",
            rulingHouse: "6th House",
            colorHEX: "#B10DC9",
            symbol: "Virgin",
            symbolEmoji: "👩",
            birthstone: "Sapphire",
            season: "Summer/Autumn Cusp",
            brightestStar: "Spica",
            characteristics: [
                "Analytical",
                "Practical",
                "Diligent",
                "Discriminating",
                "Helpful",
                "Modest"
            ],
            strengths: [
                "Analytical",
                "Practical",
                "Diligent",
                "Meticulous",
                "Reliable"
            ],
            weaknesses: [
                "Critical",
                "Perfectionist",
                "Overthinking",
                "Worrisome",
                "Fussy"
            ],
            keyTraits: [
                "Analytical",
                "Precise",
                "Helpful"
            ],
            compatibilityInfo: compatibilityInfo[.virgo]!
        ),
        .libra: ZodiacMetadata(
            emoji: "♎",
            element: "Air",
            elementEmoji: "💨",
            modality: "Cardinal",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Venus",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♀",
            rulingHouse: "7th House",
            colorHEX: "#F012BE",
            symbol: "Scales",
            symbolEmoji: "⚖️",
            birthstone: "Opal",
            season: "Autumn",
            brightestStar: "Zubeneschamali",
            characteristics: [
                "Diplomatic",
                "Fair-minded",
                "Social",
                "Cooperative",
                "Gracious",
                "Indecisive"
            ],
            strengths: [
                "Diplomatic",
                "Fair",
                "Cooperative",
                "Social",
                "Gracious"
            ],
            weaknesses: [
                "Indecisive",
                "Avoids confrontation",
                "Self-pitying",
                "Superficial",
                "Unreliable"
            ],
            keyTraits: [
                "Diplomatic",
                "Partnership-oriented",
                "Refined"
            ],
            compatibilityInfo: compatibilityInfo[.libra]!
        ),
        .scorpio: ZodiacMetadata(
            emoji: "♏",
            element: "Water",
            elementEmoji: "💧",
            modality: "Fixed",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Pluto",
            traditionalRulingPlanetName: "Mars",
            rulingPlanetSymbol: "♇",
            rulingHouse: "8th House",
            colorHEX: "#85144B",
            symbol: "Scorpion",
            symbolEmoji: "🦂",
            birthstone: "Topaz",
            season: "Autumn",
            brightestStar: "Antares",
            characteristics: [
                "Passionate",
                "Resourceful",
                "Brave",
                "Intense",
                "Mysterious",
                "Loyal"
            ],
            strengths: [
                "Determined",
                "Brave",
                "Loyal",
                "Resourceful",
                "Passionate"
            ],
            weaknesses: [
                "Jealous",
                "Secretive",
                "Resentful",
                "Suspicious",
                "Manipulative"
            ],
            keyTraits: [
                "Intense",
                "Transformative",
                "Passionate"
            ],
            compatibilityInfo: compatibilityInfo[.scorpio]!
        ),
        .sagittarius: ZodiacMetadata(
            emoji: "♐",
            element: "Fire",
            elementEmoji: "🔥",
            modality: "Mutable",
            polarity: "Positive",
            yinYang: "Yang",
            rulingPlanetName: "Jupiter",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♃",
            rulingHouse: "9th House",
            colorHEX: "#0074D9",
            symbol: "Archer",
            symbolEmoji: "🏹",
            birthstone: "Turquoise",
            season: "Autumn/Winter Cusp",
            brightestStar: "Kaus Australis",
            characteristics: [
                "Optimistic",
                "Freedom-loving",
                "Philosophical",
                "Straightforward",
                "Intellectual",
                "Adventurous"
            ],
            strengths: [
                "Optimistic",
                "Freedom-loving",
                "Honest",
                "Intellectual",
                "Enthusiastic"
            ],
            weaknesses: [
                "Tactless",
                "Restless",
                "Irresponsible",
                "Superficial",
                "Inconsistent"
            ],
            keyTraits: [
                "Adventurous",
                "Optimistic",
                "Philosophical"
            ],
            compatibilityInfo: compatibilityInfo[.sagittarius]!
        ),
        .capricorn: ZodiacMetadata(
            emoji: "♑",
            element: "Earth",
            elementEmoji: "🌎",
            modality: "Cardinal",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Saturn",
            traditionalRulingPlanetName: nil,
            rulingPlanetSymbol: "♄",
            rulingHouse: "10th House",
            colorHEX: "#111111",
            symbol: "Sea Goat",
            symbolEmoji: "🐐",
            birthstone: "Garnet",
            season: "Winter",
            brightestStar: "Deneb Algedi",
            characteristics: [
                "Responsible",
                "Disciplined",
                "Self-controlled",
                "Practical",
                "Cautious",
                "Ambitious"
            ],
            strengths: [
                "Responsible",
                "Disciplined",
                "Self-controlled",
                "Practical",
                "Patient"
            ],
            weaknesses: [
                "Pessimistic",
                "Fatalistic",
                "Rigid",
                "Cold",
                "Workaholic"
            ],
            keyTraits: [
                "Ambitious",
                "Practical",
                "Disciplined"
            ],
            compatibilityInfo: compatibilityInfo[.capricorn]!
        ),
        .ophiuchus: ZodiacMetadata(
            emoji: "⛎",
            element: "Fire/Water",
            elementEmoji: "🔥💧",
            modality: "Transitional",
            polarity: "Balanced",
            yinYang: "Balanced",
            rulingPlanetName: "Chiron",
            traditionalRulingPlanetName: "Jupiter",
            rulingPlanetSymbol: "⚕",
            rulingHouse: "Not in traditional system",
            colorHEX: "#663399",
            symbol: "Serpent Bearer",
            symbolEmoji: "🐍",
            birthstone: "Amethyst/Obsidian",
            season: "Late Autumn",
            brightestStar: "Rasalhague",
            characteristics: [
                "Healer",
                "Seeker",
                "Enlightened",
                "Mystical",
                "Passionate",
                "Balanced"
            ],
            strengths: [
                "Healing",
                "Wisdom",
                "Seeking knowledge",
                "Intuitive",
                "Balanced",
                "Magnetic"
            ],
            weaknesses: [
                "Jealous",
                "Secretive",
                "Arrogant",
                "Passionate to a fault",
                "Conflicted"
            ],
            keyTraits: [
                "Healer",
                "Seeker of wisdom",
                "Mystical"
            ],
            compatibilityInfo: compatibilityInfo[.ophiuchus]!
        ),
        .cetus: ZodiacMetadata(
            emoji: "🐋",
            element: "Water",
            elementEmoji: "💧",
            modality: "Fixed",
            polarity: "Negative",
            yinYang: "Yin",
            rulingPlanetName: "Neptune",
            traditionalRulingPlanetName: "Moon",
            rulingPlanetSymbol: "♆",
            rulingHouse: "Not in traditional system",
            colorHEX: "#4169E1",
            symbol: "Sea Monster/Whale",
            symbolEmoji: "🐋",
            birthstone: "Aquamarine/Pearl",
            season: "Winter",
            brightestStar: "Menkar",
            characteristics: [
                "Mysterious",
                "Deep",
                "Transformative",
                "Ancient",
                "Profound",
                "Primordial"
            ],
            strengths: [
                "Depth",
                "Understanding",
                "Intuition",
                "Emotional intelligence",
                "Creativity",
                "Transformative"
            ],
            weaknesses: [
                "Overwhelming",
                "Moody",
                "Secretive",
                "Withdrawn",
                "Overly complex"
            ],
            keyTraits: [
                "Mysterious",
                "Deep",
                "Primordial"
            ],
            compatibilityInfo: compatibilityInfo[.cetus]!
        )
    ]}
}

// MARK: - Compatibility Info

extension Western {

    /// Defines zodiac compatibility rules for each Western sign.
    ///
    /// Compatibility is categorised as:
    /// - `bestMatches`: Strong romantic or personal synergy.
    /// - `averageMatches`: Reasonable alignment with some effort.
    /// - `conflictingMatches`: Tensions or misunderstandings possible.
    /// - `harmfulMatches`: Traditionally inauspicious or toxic pairings.
    internal static var compatibilityInfo: [Western: CompatibilityInfo<Western>] {[
        .aquarius: CompatibilityInfo(
            bestMatches: [.gemini, .libra, .aquarius, .sagittarius],
            averageMatches: [.aries, .leo],
            conflictingMatches: [.taurus, .scorpio],
            harmfulMatches: [.cancer, .capricorn]
        ),
        .pisces: CompatibilityInfo(
            bestMatches: [.cancer, .scorpio, .pisces, .capricorn],
            averageMatches: [.taurus, .virgo],
            conflictingMatches: [.gemini, .sagittarius],
            harmfulMatches: [.libra, .aquarius]
        ),
        .aries: CompatibilityInfo(
            bestMatches: [.leo, .sagittarius, .aries, .gemini],
            averageMatches: [.aquarius, .libra],
            conflictingMatches: [.cancer, .capricorn],
            harmfulMatches: [.virgo, .pisces]
        ),
        .taurus: CompatibilityInfo(
            bestMatches: [.virgo, .capricorn, .taurus, .cancer],
            averageMatches: [.pisces, .scorpio],
            conflictingMatches: [.leo, .aquarius],
            harmfulMatches: [.sagittarius, .aries]
        ),
        .gemini: CompatibilityInfo(
            bestMatches: [.libra, .aquarius, .gemini, .aries],
            averageMatches: [.leo, .sagittarius],
            conflictingMatches: [.virgo, .pisces],
            harmfulMatches: [.scorpio, .capricorn]
        ),
        .cancer: CompatibilityInfo(
            bestMatches: [.scorpio, .pisces, .cancer, .taurus],
            averageMatches: [.virgo, .capricorn],
            conflictingMatches: [.aries, .libra],
            harmfulMatches: [.aquarius, .leo]
        ),
        .leo: CompatibilityInfo(
            bestMatches: [.aries, .sagittarius, .leo, .libra],
            averageMatches: [.gemini, .aquarius],
            conflictingMatches: [.taurus, .scorpio],
            harmfulMatches: [.virgo, .capricorn]
        ),
        .virgo: CompatibilityInfo(
            bestMatches: [.taurus, .capricorn, .virgo, .cancer],
            averageMatches: [.scorpio, .pisces],
            conflictingMatches: [.gemini, .sagittarius],
            harmfulMatches: [.aries, .leo]
        ),
        .libra: CompatibilityInfo(
            bestMatches: [.gemini, .aquarius, .libra, .leo],
            averageMatches: [.aries, .sagittarius],
            conflictingMatches: [.cancer, .capricorn],
            harmfulMatches: [.virgo, .pisces]
        ),
        .scorpio: CompatibilityInfo(
            bestMatches: [.cancer, .pisces, .scorpio, .capricorn],
            averageMatches: [.virgo, .taurus],
            conflictingMatches: [.leo, .aquarius],
            harmfulMatches: [.gemini, .sagittarius]
        ),
        .sagittarius: CompatibilityInfo(
            bestMatches: [.aries, .leo, .sagittarius, .aquarius],
            averageMatches: [.libra, .gemini],
            conflictingMatches: [.pisces, .virgo],
            harmfulMatches: [.taurus, .scorpio]
        ),
        .capricorn: CompatibilityInfo(
            bestMatches: [.taurus, .virgo, .capricorn, .scorpio],
            averageMatches: [.pisces, .cancer],
            conflictingMatches: [.aries, .libra],
            harmfulMatches: [.gemini, .sagittarius]
        ),
        .ophiuchus: CompatibilityInfo(
            bestMatches: [.pisces, .capricorn, .cancer, .virgo],
            averageMatches: [.scorpio, .taurus],
            conflictingMatches: [.leo, .aquarius],
            harmfulMatches: [.sagittarius, .gemini]
        ),
        .cetus: CompatibilityInfo(
            bestMatches: [.cancer, .scorpio, .pisces, .ophiuchus],
            averageMatches: [.capricorn, .taurus],
            conflictingMatches: [.aries, .leo],
            harmfulMatches: [.gemini, .aquarius]
        )
    ]}
}
