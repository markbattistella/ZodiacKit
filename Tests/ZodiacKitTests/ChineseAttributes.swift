//
//  ZodiacKit
//  Created by Mark Battistella
//

import XCTest
@testable import ZodiacKit

// MARK: - Chinese Zodiac Tests: Attributes
extension ZodiacKitTests {
    
    /// Tests that the names of Chinese zodiac signs are correctly capitalized.
    func testChineseSignNamesAreCapitalized() {
        for chineseSign in ChineseZodiacSign.allCases {
            XCTAssertEqual(chineseSign.name, chineseSign.rawValue.capitalized)
        }
    }
    
    /// Tests that the `name` attribute of each Chinese zodiac sign matches the expected 
    /// capitalized raw value.
    func testChineseSignAttributeName() {
        let expectedValues = ChineseZodiacSign.allCases.map { $0.rawValue.capitalized }
        testAttribute(
            attributeName: "Name",
            expectedValues: expectedValues,
            attributeClosure: { (sign: ChineseZodiacSign) -> String in
                return sign.name
            }
        )
    }
    
    /// Tests the fixed element associated with each Chinese zodiac sign against a predefined 
    /// list of expected values.
    func testChineseSignAttributeFixedElement() {
        let expectedValues = [
            "Earth", "Earth", "Earth", "Fire", "Metal", "Earth",
            "Water", "Wood", "Water", "Metal", "Fire", "Wood"
        ]
        testAttribute(
            attributeName: "Fixed Element",
            expectedValues: expectedValues,
            attributeClosure: { (sign: ChineseZodiacSign) -> String in
                return sign.fixedElement
            }
        )
    }
    
    /// Tests the emoji representation of the fixed element associated with each Chinese 
    /// zodiac sign.
    func testChineseSignAttributeFixedElementEmoji() {
        let expectedValues = [
            "🪨", "🪨", "🪨", "🔥", "🔗", "🪨",
            "💧", "🪵", "💧", "🔗", "🔥", "🪵"
        ]
        testAttribute(
            attributeName: "Fixed Element Emoji",
            expectedValues: expectedValues,
            attributeClosure: { (sign: ChineseZodiacSign) -> String in
                return sign.fixedElementEmoji
            }
        )
    }
    
    /// Tests the emoji representation of each Chinese zodiac sign.
    func testChineseSignAttributeEmoji() {
        let expectedValues = [
            "🐕", "🐉", "🐐", "🐎", "🐒", "🐂",
            "🐖", "🐇", "🐀", "🐓", "🐍", "🐅"
        ]
        testAttribute(
            attributeName: "Emoji",
            expectedValues: expectedValues,
            attributeClosure: { (sign: ChineseZodiacSign) -> String in
                return sign.emoji
            }
        )
    }
    
    /// Tests the Yin Yang classification of each Chinese zodiac sign, ensuring each sign 
    /// is correctly classified as either Yin or Yang.
    func testChineseSignAttributeYinYang() {
        let expectedValues = [
            "Yang", "Yang", "Yang", "Yang", "Yin", "Yin",
            "Yin", "Yin", "Yin", "Yin", "Yin", "Yin"
        ]
        testAttribute(
            attributeName: "Yin Yang",
            expectedValues: expectedValues,
            attributeClosure: { (sign: ChineseZodiacSign) -> String in
                return sign.yinYang
            }
        )
    }
}
