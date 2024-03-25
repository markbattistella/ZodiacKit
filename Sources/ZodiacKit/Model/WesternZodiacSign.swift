//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if canImport(UIKit)
import UIKit
public typealias Colour = UIColor
#elseif canImport(AppKit)
import AppKit
public typealias Colour = NSColor
#endif

/// Represents Western zodiac signs
public enum WesternZodiacSign: String, ZodiacSign {

    /// Available list of Western zodiac signs
    case aquarius, aries, cancer, capricorn, gemini, leo, libra,
         pisces, sagittarius, scorpio, taurus, virgo
}

/// Attributable elements to the `WesternZodiacSign`
extension WesternZodiacSign {

    /// The capitalized name of the zodiac sign
    public var name: String { self.rawValue.capitalized }

    /// Represents the worldly element associated with the zodiac sign.
    public var worldlyElement: String {
        switch self {
            case .aquarius, .gemini, .libra: "Air"
            case .aries, .leo, .sagittarius: "Fire"
            case .cancer, .scorpio, .pisces: "Water"
            case .capricorn, .taurus, .virgo: "Earth"
        }
    }

    /// Represents the worldly element emoji associated with the zodiac sign.
    public var worldlyElementEmoji: String {
        switch self {
            case .aquarius, .gemini, .libra: "💨"
            case .aries, .leo, .sagittarius: "🔥"
            case .cancer, .scorpio, .pisces: "💧"
            case .capricorn, .taurus, .virgo: "🪨"
        }
    }

    /// Represents the emoji associated with the zodiac sign.
    public var emoji: String {
        switch self {
            case .aquarius: "♒️"
            case .aries: "♈️"
            case .cancer: "♋️"
            case .capricorn: "♑️"
            case .gemini: "♊️"
            case .leo: "♌️"
            case .libra: "♎️"
            case .pisces: "♓️"
            case .sagittarius: "♐️"
            case .scorpio: "♏️"
            case .taurus: "♉️"
            case .virgo: "♍️"
        }
    }

    /// Represents the color associated with the zodiac sign.
    public var color: Colour {
        switch self {
            case .aquarius: .systemBlue
            case .aries: .systemRed
            case .cancer: .systemPurple
            case .capricorn: .black
            case .gemini: .systemYellow
            case .leo: .systemOrange
            case .libra: .systemPink
            case .pisces: .systemGreen
            case .sagittarius: .systemBrown
            case .scorpio: .magenta
            case .taurus: .gray
            case .virgo: .systemBrown
        }
    }

    /// Represents the name of the ruling planet associated with the zodiac sign.
    public var rulingPlanetName: String {
        switch self {
            case .aquarius: "Uranus"
            case .aries: "Mars"
            case .cancer: "Moon"
            case .capricorn: "Saturn"
            case .gemini: "Mercury"
            case .leo: "Sun"
            case .libra: "Venus"
            case .pisces: "Neptune"
            case .sagittarius: "Jupiter"
            case .scorpio: "Pluto" // Still a planet, maybe?
            case .taurus: "Venus"
            case .virgo: "Mercury"
        }
    }

    /// Represents the symbol of the ruling planet associated with the zodiac sign.
    public var rulingPlanet: String {
        switch self {
            case .aquarius: "♅"
            case .aries: "♂"
            case .cancer: "☽"
            case .capricorn: "♄"
            case .gemini: "☿"
            case .leo: "☉"
            case .libra: "♀"
            case .pisces: "♆"
            case .sagittarius: "♃"
            case .scorpio: "♇"
            case .taurus: "♀"
            case .virgo: "☿"
        }
    }
}
