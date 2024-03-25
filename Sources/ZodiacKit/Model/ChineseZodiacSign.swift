//
//  ZodiacKit
//  Created by Mark Battistella
//

import Foundation

/// Represents Chinese zodiac signs
public enum ChineseZodiacSign: String, ZodiacSign {

    /// Available list of Chinese zodiac signs
    case dog, dragon, goat, horse, monkey, ox,
         pig, rabbit, rat, rooster, snake, tiger
}

extension ChineseZodiacSign {

    /// The capitalized name of the zodiac sign
    public var name: String { self.rawValue.capitalized }

    /// A string describing the characteristics of the zodiac sign, joined by commas.
    public var characteristicsDescription: String {
        self.characteristics.joined(separator: ", ")
    }

    /// Represents the fixed element associated with the zodiac sign.
    public var fixedElement: String {
        switch self {
            case .rat, .pig: "Water"
            case .ox, .dragon, .goat, .dog: "Earth"
            case .tiger, .rabbit: "Wood"
            case .snake, .horse: "Fire"
            case .monkey, .rooster: "Metal"
        }
    }

    /// Represents the worldly element emoji associated with the zodiac sign.
    public var fixedElementEmoji: String {
        switch self {
            case .rat, .pig: "💧"
            case .ox, .dragon, .goat, .dog: "🪨"
            case .tiger, .rabbit: "🪵"
            case .snake, .horse: "🔥"
            case .monkey, .rooster: "🔗"
        }
    }

    /// Represents the emoji associated with the zodiac sign.
    public var emoji: String {
        switch self {
            case .rat: "🐀"
            case .ox: "🐂"
            case .tiger: "🐅"
            case .rabbit: "🐇"
            case .dragon: "🐉"
            case .snake: "🐍"
            case .horse: "🐎"
            case .goat: "🐐"
            case .monkey: "🐒"
            case .rooster: "🐓"
            case .dog: "🐕"
            case .pig: "🐖"
        }
    }

    /// Represents the Yin or Yang attribute associated with the zodiac sign.
    public var yinYang: String {
        switch self {
            case .rat, .ox, .tiger, .rabbit, .snake, .monkey, .rooster, .pig: "Yin"
            case .dragon, .horse, .goat, .dog: "Yang"
        }
    }

    /// Represents the list of characteristics attributed to the zodiac sign.
    public var characteristics: [String] {
        switch self {
            case .rat:
                ["Intelligence", "Adaptability", "Quick-wit",
                 "Charm", "Artistry", "Gregariousness"]
            case .ox:
                ["Loyalty", "Reliability", "Thoroughness", "Strength",
                 "Reasonability", "Steadiness", "Determination"]
            case .tiger:
                ["Enthusiasm", "Courage", "Ambition", "Leadership",
                 "Confidence", "Charisma"]
            case .rabbit:
                ["Trustworthiness", "Empathy", "Modesty", "Diplomacy",
                 "Sincerity", "Sociability"]
            case .dragon:
                ["Luckiness", "Flexibility", "Eccentricity", "Imagination",
                 "Artistry", "Spirituality"]
            case .snake:
                ["Philosophical", "Organized", "Intelligent", "Intuitive",
                 "Elegant", "Attentive", "Decisive"]
            case .horse:
                ["Adaptability", "Loyalty", "Courage", "Ambition",
                 "Intelligence", "Adventure", "Strong freedom"]
            case .goat:
                ["Imagination", "Creativity", "Empathy", "Generosity",
                 "Honesty", "Persistence", "Gentleness"]
            case .monkey:
                ["Intelligence", "Adaptability", "Quick-wit", "Charm",
                 "Luck", "Flexibility"]
            case .rooster:
                ["Honesty", "Energy", "Intelligence", "Flamboyance",
                 "Flexibility", "Diversity", "Confidence"]
            case .dog:
                ["Loyalty", "Sincerity", "Reliability", "Intelligence",
                 "Sociability", "Understanding", "Patience"]
            case .pig:
                ["Honesty", "Sincerity", "Tolerance", "Hardworking",
                 "Generosity", "Optimism", "Peace"]
        }
    }

    /// Represents the compatibility of the zodiac sign with other signs.
    public var compatibility: [ChineseZodiacSign] {
        switch self {
            case .rat: [.dragon, .monkey]
            case .ox: [.rat, .rooster, .snake]
            case .tiger: [.horse, .dog]
            case .rabbit: [.goat, .pig, .dog]
            case .dragon: [.rooster, .rat, .monkey]
            case .snake: [.ox, .rooster]
            case .horse: [.tiger, .dog, .goat]
            case .goat: [.rabbit, .horse, .pig]
            case .monkey: [.rat, .dragon]
            case .rooster: [.ox, .dragon, .snake]
            case .dog: [.tiger, .rabbit, .horse]
            case .pig: [.goat, .rabbit]
        }
    }
}
