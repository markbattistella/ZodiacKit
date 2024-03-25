//
//  ZodiacKit
//  Created by Mark Battistella
//

import XCTest
@testable import ZodiacKit

// MARK: - Western Zodiac Tests: Attributes
extension ZodiacKitTests {

    // Defines a typealias for color to support cross-platform compatibility between
    // UIKit (iOS) and AppKit (macOS).
    #if canImport(UIKit)
    internal typealias Colour = UIColor
    #elseif canImport(AppKit)
    internal typealias Colour = NSColor
    #endif

    /// Tests that the names of Western zodiac signs are correctly capitalized.
    func testWesternSignNamesAreCapitalized() {
        for westernSign in WesternZodiacSign.allCases {
            XCTAssertEqual(westernSign.name, westernSign.rawValue.capitalized)
        }
    }

    /// Tests that the `name` attribute of each Western zodiac sign matches the expected
    /// capitalized raw value.
    func testWesternSignAttributeName() {
        let expectedValues = WesternZodiacSign.allCases.map { $0.rawValue.capitalized }
        testAttribute(
            attributeName: "Name",
            expectedValues: expectedValues,
            attributeClosure: { (sign: WesternZodiacSign) -> String in
                return sign.name
            }
        )
    }

    /// Tests the worldly element associated with each Western zodiac sign against a predefined
    /// list of expected values.
    func testWesternSignAttributeWorldlyElement() {
        let expectedValues = [
            "Air", "Fire", "Water", "Earth",
            "Air", "Fire", "Air", "Water",
            "Fire", "Water", "Earth", "Earth"
        ]
        testAttribute(
            attributeName: "Worldly Element",
            expectedValues: expectedValues,
            attributeClosure: { (sign: WesternZodiacSign) -> String in
                return sign.worldlyElement
            }
        )
    }

    /// Tests the emoji representation of the worldly element associated with each
    /// Western zodiac sign.
    func testWesternSignAttributeWorldlyElementEmoji() {
        let expectedValues = [
            "💨", "🔥", "💧", "🪨",
            "💨", "🔥", "💨", "💧",
            "🔥", "💧", "🪨", "🪨"
        ]
        testAttribute(
            attributeName: "Emoji",
            expectedValues: expectedValues,
            attributeClosure: { (sign: WesternZodiacSign) -> String in
                return sign.worldlyElementEmoji
            }
        )
    }

    /// Tests the emoji representation of each Western zodiac sign.
    func testWesternSignAttributeEmoji() {
        let expectedValues = [
            "♒️", "♈️", "♋️", "♑️",
            "♊️", "♌️", "♎️", "♓️",
            "♐️", "♏️", "♉️", "♍️"
        ]
        testAttribute(
            attributeName: "Emoji",
            expectedValues: expectedValues,
            attributeClosure: { (sign: WesternZodiacSign) -> String in
                return sign.emoji
            }
        )
    }

    /// Tests the color associated with each Western zodiac sign.
    func testWesternSignAttributeColor() {
        let expectedColors: [Colour] = [
            .systemBlue, .systemRed, .systemPurple, .black,
            .systemYellow, .systemOrange, .systemPink, .systemGreen,
            .systemBrown, .magenta, .gray, .systemBrown
        ]
        testAttribute(
            attributeName: "Color",
            expectedValues: expectedColors,
            attributeClosure: { (sign: WesternZodiacSign) -> Colour in
                return sign.color
            }
        )
    }

    /// Tests the name of the ruling planet associated with each Western zodiac sign.
    func testWesternSignAttributeRulingPlanetName() {
        let expectedRulingPlanets = [
            "Uranus", "Mars", "Moon", "Saturn",
            "Mercury", "Sun", "Venus", "Neptune",
            "Jupiter", "Pluto", "Venus", "Mercury"
        ]
        testAttribute(
            attributeName: "Ruling Planet Name",
            expectedValues: expectedRulingPlanets,
            attributeClosure: { (sign: WesternZodiacSign) -> String in
                return sign.rulingPlanetName
            }
        )
    }

    /// Tests the symbol of the ruling planet associated with each Western zodiac sign.
    func testWesternSignAttributeRulingPlanet() {
        let expectedRulingPlanetSymbols = [
            "♅", "♂", "☽", "♄",
            "☿", "☉", "♀", "♆",
            "♃", "♇", "♀", "☿"
        ]
        testAttribute(
            attributeName: "Ruling Planet",
            expectedValues: expectedRulingPlanetSymbols,
            attributeClosure: { (sign: WesternZodiacSign) -> String in
                return sign.rulingPlanet
            }
        )
    }
}
