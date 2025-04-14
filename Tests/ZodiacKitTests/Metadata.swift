//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import XCTest
@testable import ZodiacKit

// MARK: - Metadata

extension ZodiacKitTests {
    
    /// Validates the completeness of Western zodiac metadata across all supported systems.
    ///
    /// For each system (e.g., Tropical, Sidereal, Equal, IAU, Custom), this test verifies that
    /// every zodiac sign has non-empty values for all critical metadata fields including:
    /// - Display (name, emoji, symbol, symbolEmoji)
    /// - Astrological attributes (element, polarity, modality, planet, house)
    /// - Visual representation (color, birthstone, brightestStar)
    /// - Descriptions (characteristics, strengths, weaknesses, key traits)
    /// - Compatibility groupings (best, average, conflicting, harmful)
    ///
    /// This ensures each sign can be reliably used in frontend UIs and internal logic.
    func testWesternZodiacMetadataCompleteness() {
        for (system, label) in systemsToTest {
            let service = ZodiacService(system: system)
            for sign in service.allWesternZodiacs {
                XCTAssertFalse(
                    sign.name.isEmpty,
                    "\(label): \(sign) has empty name"
                )
                XCTAssertFalse(
                    sign.emoji.isEmpty,
                    "\(label): \(sign) has empty emoji"
                )
                XCTAssertFalse(
                    sign.symbol.isEmpty,
                    "\(label): \(sign) has empty symbol"
                )
                XCTAssertFalse(
                    sign.symbolEmoji.isEmpty,
                    "\(label): \(sign) has empty symbol emoji"
                )
                XCTAssertFalse(
                    sign.element.isEmpty,
                    "\(label): \(sign) has empty element"
                )
                XCTAssertFalse(
                    sign.elementEmoji.isEmpty,
                    "\(label): \(sign) has empty element emoji"
                )
                XCTAssertFalse(
                    sign.modality.isEmpty,
                    "\(label): \(sign) has empty modality"
                )
                XCTAssertFalse(
                    sign.rulingPlanetName.isEmpty,
                    "\(label): \(sign) has empty rulingPlanetName"
                )
                XCTAssertFalse(
                    sign.rulingPlanetSymbol.isEmpty,
                    "\(label): \(sign) has empty rulingPlanetSymbol"
                )
                XCTAssertFalse(
                    sign.rulingHouse.isEmpty,
                    "\(label): \(sign) has empty rulingHouse"
                )
                XCTAssertFalse(
                    sign.yinYang.isEmpty,
                    "\(label): \(sign) has empty yinYang"
                )
                XCTAssertFalse(
                    sign.season.isEmpty,
                    "\(label): \(sign) has empty season"
                )
                XCTAssertFalse(
                    sign.birthstone.isEmpty,
                    "\(label): \(sign) has empty birthstone"
                )
                XCTAssertFalse(
                    sign.colorHEX.isEmpty,
                    "\(label): \(sign) has empty colorHEX"
                )
                XCTAssertFalse(
                    sign.brightestStar.isEmpty,
                    "\(label): \(sign) has empty brightestStar"
                )
                XCTAssertFalse(
                    sign.characteristics.isEmpty,
                    "\(label): \(sign) missing characteristics"
                )
                XCTAssertFalse(
                    sign.strengths.isEmpty,
                    "\(label): \(sign) missing strengths"
                )
                XCTAssertFalse(
                    sign.weaknesses.isEmpty,
                    "\(label): \(sign) missing weaknesses"
                )
                XCTAssertFalse(
                    sign.keyTraits.isEmpty,
                    "\(label): \(sign) missing key traits"
                )
                XCTAssertFalse(
                    sign.bestMatches.isEmpty,
                    "\(label): \(sign) has no best matches"
                )
                XCTAssertFalse(
                    sign.averageMatches.isEmpty,
                    "\(label): \(sign) has no average matches"
                )
                XCTAssertFalse(
                    sign.conflictingMatches.isEmpty,
                    "\(label): \(sign) has no conflicting matches"
                )
                XCTAssertFalse(
                    sign.harmfulMatches.isEmpty,
                    "\(label): \(sign) has no harmful matches"
                )
            }
        }
    }
    
    /// Validates the completeness of Chinese zodiac metadata for all 12 animal signs.
    ///
    /// Ensures every sign in the Chinese system provides valid, non-empty values for
    /// essential metadata such as:
    /// - Display fields (name, emoji, symbol)
    /// - Astrological properties (element, ruling planet, yin/yang, polarity)
    /// - Symbolism (season, brightest star, birthstone, etc.)
    /// - Character profiling (strengths, weaknesses, traits)
    /// - Compatibility relationships (best, average, conflicting, harmful)
    ///
    /// This test confirms each sign is sufficiently described for use in logic, UI, and content generation.
    func testChineseZodiacMetadataCompleteness() {
        for sign in Chinese.allCases {
            XCTAssertFalse(
                sign.name.isEmpty,
                "\(sign): name is empty"
            )
            XCTAssertFalse(
                sign.emoji.isEmpty,
                "\(sign): emoji is empty"
            )
            XCTAssertFalse(
                sign.symbol.isEmpty,
                "\(sign): symbol is empty"
            )
            XCTAssertFalse(
                sign.symbolEmoji.isEmpty,
                "\(sign): symbol emoji is empty"
            )
            XCTAssertFalse(
                sign.element.isEmpty,
                "\(sign): element is empty"
            )
            XCTAssertFalse(
                sign.elementEmoji.isEmpty,
                "\(sign): element emoji is empty"
            )
            XCTAssertFalse(
                sign.modality.isEmpty,
                "\(sign): modality is empty"
            )
            XCTAssertFalse(
                sign.rulingPlanetName.isEmpty,
                "\(sign): ruling planet name is empty"
            )
            XCTAssertFalse(
                sign.rulingPlanetSymbol.isEmpty,
                "\(sign): ruling planet symbol is empty"
            )
            XCTAssertFalse(
                sign.rulingHouse.isEmpty,
                "\(sign): ruling house is empty"
            )
            XCTAssertFalse(
                sign.yinYang.isEmpty,
                "\(sign): yinYang is empty"
            )
            XCTAssertFalse(
                sign.polarity.isEmpty,
                "\(sign): polarity is empty"
            )
            XCTAssertFalse(
                sign.season.isEmpty,
                "\(sign): season is empty"
            )
            XCTAssertFalse(
                sign.colorHEX.isEmpty,
                "\(sign): colorHEX is empty"
            )
            XCTAssertFalse(
                sign.brightestStar.isEmpty,
                "\(sign): brightestStar is empty"
            )
            XCTAssertFalse(
                sign.characteristics.isEmpty,
                "\(sign): characteristics are missing"
            )
            XCTAssertFalse(
                sign.strengths.isEmpty,
                "\(sign): strengths are missing"
            )
            XCTAssertFalse(
                sign.weaknesses.isEmpty,
                "\(sign): weaknesses are missing"
            )
            XCTAssertFalse(
                sign.keyTraits.isEmpty,
                "\(sign): keyTraits are missing"
            )
            XCTAssertFalse(
                sign.bestMatches.isEmpty,
                "\(sign): bestMatches is empty"
            )
            XCTAssertFalse(
                sign.averageMatches.isEmpty,
                "\(sign): averageMatches is empty"
            )
            XCTAssertFalse(
                sign.conflictingMatches.isEmpty,
                "\(sign): conflictingMatches is empty"
            )
            XCTAssertFalse(
                sign.harmfulMatches.isEmpty,
                "\(sign): harmfulMatches is empty"
            )
        }
    }
}
