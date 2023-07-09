//
//  ZodiacKit
//  Created by Mark Battistella
//

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Represents zodiac signs
public enum Sign: String, CaseIterable, Codable {

	/// Available list of zodiac signs
	case aquarius, aries, cancer, capricorn, gemini, leo, libra, pisces, sagittarius, scorpio, taurus, virgo
}

/// Attributable elements to the `Sign`
extension Sign {

	#if canImport(UIKit)
	public typealias Colour = UIColor
	#elseif canImport(AppKit)
	public typealias Colour = NSColor
	#endif

	/// The capitalized name of the zodiac sign
	public var name: String { self.rawValue.capitalized }

	/// Represents the worldly element associated with the zodiac sign.
	public var worldlyElement: String {
		switch self {
			case .aquarius, .gemini, .libra:
				return "Air"
			case .aries, .leo, .sagittarius:
				return "Fire"
			case .cancer, .scorpio, .pisces:
				return "Water"
			case .capricorn, .taurus, .virgo:
				return "Earth"
		}
	}

	/// Represents the emoji associated with the zodiac sign.
	public var emoji: String {
		switch self {
			case .aquarius:
				return "♒️"
			case .aries:
				return "♈️"
			case .cancer:
				return "♋️"
			case .capricorn:
				return "♑️"
			case .gemini:
				return "♊️"
			case .leo:
				return "♌️"
			case .libra:
				return "♎️"
			case .pisces:
				return "♓️"
			case .sagittarius:
				return "♐️"
			case .scorpio:
				return "♏️"
			case .taurus:
				return "♉️"
			case .virgo:
				return "♍️"
		}
	}

	/// Represents the color associated with the zodiac sign.
	public var color: Colour {
		switch self {
			case .aquarius:
				return .systemBlue
			case .aries:
				return .systemRed
			case .cancer:
				return .systemPurple
			case .capricorn:
				return .black
			case .gemini:
				return .systemYellow
			case .leo:
				return .systemOrange
			case .libra:
				return .systemPink
			case .pisces:
				return .systemGreen
			case .sagittarius:
				return .systemBrown
			case .scorpio:
				return .magenta
			case .taurus:
				return .gray
			case .virgo:
				return .systemBrown
		}
	}

	/// Represents the name of the ruling planet associated with the zodiac sign.
	public var rulingPlanetName: String {
		switch self {
			case .aquarius:
				return "Uranus"
			case .aries:
				return "Mars"
			case .cancer:
				return "Moon"
			case .capricorn:
				return "Saturn"
			case .gemini:
				return "Mercury"
			case .leo:
				return "Sun"
			case .libra:
				return "Venus"
			case .pisces:
				return "Neptune"
			case .sagittarius:
				return "Jupiter"
			case .scorpio:
				return "Pluto"
			case .taurus:
				return "Venus"
			case .virgo:
				return "Mercury"
		}
	}

	/// Represents the symbol of the ruling planet associated with the zodiac sign.
	public var rulingPlanet: String {
		switch self {
			case .aquarius:
				return "♅"
			case .aries:
				return "♂"
			case .cancer:
				return "☽"
			case .capricorn:
				return "♄"
			case .gemini:
				return "☿"
			case .leo:
				return "☉"
			case .libra:
				return "♀"
			case .pisces:
				return "♆"
			case .sagittarius:
				return "♃"
			case .scorpio:
				return "♇"
			case .taurus:
				return "♀"
			case .virgo:
				return "☿"
		}
	}
}
