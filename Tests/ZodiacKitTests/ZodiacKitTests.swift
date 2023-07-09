//
//  ZodiacKit
//  Created by Mark Battistella
//

import XCTest
@testable import ZodiacKit

class ZodiacKitTests: XCTestCase {

	#if canImport(UIKit)
	public typealias Colour = UIColor
	#elseif canImport(AppKit)
	public typealias Colour = NSColor
	#endif


	// MARK: - variables

	var validator: ZodiacDateValidator!
	var zodiacService: ZodiacService!


	// MARK: - setup
	override func setUp() {
		super.setUp()
		self.validator = ZodiacDateValidator()
		self.zodiacService = try? ZodiacService()
	}


	// MARK: - data tests

	/// Check all zodiacs return a capitalized name
	func testSignNameCapitalized() {
		for sign in Sign.allCases {
			XCTAssertEqual(sign.name, sign.rawValue.capitalized)
		}
	}

	/// Tests the `name` attribute of the `Sign` enum to ensure each sign's name is correctly capitalized.
	func testSignAttributeName() {
		let expectedNames = Sign.allCases.map { $0.rawValue.capitalized }
		testAttribute(
			attributeName: "Name",
			expectedValues: expectedNames,
			attributeClosure: { $0.name }
		)
	}

	/// Tests the `worldlyElement` attribute of the `Sign` enum to ensure each sign's worldly element is correct.
	func testSignAttributeWorldlyElement() {
		let expectedElements = [
			"Air", "Fire", "Water", "Earth",
			"Air", "Fire", "Air", "Water",
			"Fire", "Water", "Earth", "Earth"
		]
		testAttribute(
			attributeName: "Worldly Element",
			expectedValues: expectedElements,
			attributeClosure: { $0.worldlyElement }
		)
	}

	/// Tests the `emoji` attribute of the `Sign` enum to ensure each sign's emoji representation is correct.
	func testSignAttributeEmoji() {
		let expectedEmojis = [
			"♒️", "♈️", "♋️", "♑️",
			"♊️", "♌️", "♎️", "♓️",
			"♐️", "♏️", "♉️", "♍️"
		]
		testAttribute(
			attributeName: "Emoji",
			expectedValues: expectedEmojis,
			attributeClosure: { $0.emoji }
		)
	}

	/// Tests the `rulingPlanetName` attribute of the `Sign` enum to ensure each sign's ruling planet name is correct.
	func testSignAttributeRulingPlanetName() {
		let expectedRulingPlanets = [
			"Uranus", "Mars", "Moon", "Saturn",
			"Mercury", "Sun", "Venus", "Neptune",
			"Jupiter", "Pluto", "Venus", "Mercury"
		]
		testAttribute(
			attributeName: "Ruling Planet Name",
			expectedValues: expectedRulingPlanets,
			attributeClosure: { $0.rulingPlanetName }
		)
	}

	/// Tests the `rulingPlanet` attribute of the `Sign` enum to ensure each sign's ruling planet symbol is correct.
	func testSignAttributeRulingPlanetSymbol() {
		let expectedRulingPlanetSymbols = [
			"♅", "♂", "☽", "♄",
			"☿", "☉", "♀", "♆",
			"♃", "♇", "♀", "☿"
		]
		testAttribute(
			attributeName: "Ruling Planet",
			expectedValues: expectedRulingPlanetSymbols,
			attributeClosure: { $0.rulingPlanet }
		)
	}

	/// Tests the `color` attribute of the `Sign` enum to ensure each sign's associated color is correct.
	func testSignAttributeColor() {
		let expectedColors: [Colour] = [
			.systemBlue, .systemRed, .systemPurple, .black,
			.systemYellow, .systemOrange, .systemPink, .systemGreen,
			.systemBrown, .magenta, .gray, .systemBrown
		]
		testAttribute(
			attributeName: "Color",
			expectedValues: expectedColors,
			attributeClosure: { $0.color }
		)
	}

	// MARK: - default date tests

	/// Check that the start date returns correct zodiac from default list
	func testStartDateReturnsCorrectSign() {
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 20, month: 1)), .aquarius)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 19, month: 2)), .pisces)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 21, month: 3)), .aries)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 20, month: 4)), .taurus)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 21, month: 5)), .gemini)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 21, month: 6)), .cancer)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 23, month: 7)), .leo)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 23, month: 8)), .virgo)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 23, month: 9)), .libra)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 23, month: 10)), .scorpio)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 22, month: 11)), .sagittarius)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 22, month: 12)), .capricorn)
	}

	/// Check that the end date returns correct zodiac from default list
	func testEndDateReturnsCorrectSign() {
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 18, month: 2)), .aquarius)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 20, month: 3)), .pisces)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 19, month: 4)), .aries)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 20, month: 5)), .taurus)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 20, month: 6)), .gemini)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 22, month: 7)), .cancer)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 22, month: 8)), .leo)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 22, month: 9)), .virgo)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 22, month: 10)), .libra)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 21, month: 11)), .scorpio)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 21, month: 12)), .sagittarius)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 19, month: 1)), .capricorn)
	}

	/// Check that the middle date returns correct zodiac from default list
	func testDateInMiddleReturnsCorrectSign() {
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 2)), .aquarius)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 3)), .pisces)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 4)), .aries)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 5)), .taurus)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 6)), .gemini)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 7)), .cancer)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 8)), .leo)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 9)), .virgo)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 10)), .libra)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 11)), .scorpio)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 12)), .sagittarius)
		XCTAssertEqual(try? zodiacService.getZodiac(from: createDate(day: 10, month: 1)), .capricorn)
	}


	// MARK: - custom dates tests

	/// Valid list of custom zodiacs
	func testCustomZodiacsValidation() {
		let customZodiacsValid = [
			Zodiac(sign: .aquarius,    startDate: .init(day: 1,  month: 1), endDate: .init(day: 31,  month: 1)),
			Zodiac(sign: .pisces,      startDate: .init(day: 1,  month: 2), endDate: .init(day: 29,  month: 2)),
			Zodiac(sign: .aries,       startDate: .init(day: 1,  month: 3), endDate: .init(day: 31,  month: 3)),
			Zodiac(sign: .taurus,      startDate: .init(day: 1,  month: 4), endDate: .init(day: 30,  month: 4)),
			Zodiac(sign: .gemini,      startDate: .init(day: 1,  month: 5), endDate: .init(day: 31,  month: 5)),
			Zodiac(sign: .cancer,      startDate: .init(day: 1,  month: 6), endDate: .init(day: 30,  month: 6)),
			Zodiac(sign: .leo,         startDate: .init(day: 1,  month: 7), endDate: .init(day: 31,  month: 7)),
			Zodiac(sign: .virgo,       startDate: .init(day: 1,  month: 8), endDate: .init(day: 31,  month: 8)),
			Zodiac(sign: .libra,       startDate: .init(day: 1,  month: 9), endDate: .init(day: 30,  month: 9)),
			Zodiac(sign: .scorpio,     startDate: .init(day: 1, month: 10), endDate: .init(day: 31, month: 10)),
			Zodiac(sign: .sagittarius, startDate: .init(day: 1, month: 11), endDate: .init(day: 30, month: 11)),
			Zodiac(sign: .capricorn,   startDate: .init(day: 1, month: 12), endDate: .init(day: 31, month: 12))
		]
		XCTAssertNoThrow(try validator.validate(zodiacs: customZodiacsValid))
	}

	/// Invalid list of custom zodiacs - duplicate for Aquarius
	func testCustomZodiacsValidationThrowsErrorDuplicate() {
		let customZodiacsInvalid = [
			Zodiac(sign: .aquarius,    startDate: .init(day: 1,  month: 1), endDate: .init(day: 31,  month: 1)),
			Zodiac(sign: .aquarius,    startDate: .init(day: 1,  month: 1), endDate: .init(day: 31,  month: 1)),
			Zodiac(sign: .pisces,      startDate: .init(day: 1,  month: 2), endDate: .init(day: 29,  month: 2)),
			Zodiac(sign: .aries,       startDate: .init(day: 1,  month: 3), endDate: .init(day: 31,  month: 3)),
			Zodiac(sign: .taurus,      startDate: .init(day: 1,  month: 4), endDate: .init(day: 30,  month: 4)),
			Zodiac(sign: .gemini,      startDate: .init(day: 1,  month: 5), endDate: .init(day: 31,  month: 5)),
			Zodiac(sign: .cancer,      startDate: .init(day: 1,  month: 6), endDate: .init(day: 30,  month: 6)),
			Zodiac(sign: .leo,         startDate: .init(day: 1,  month: 7), endDate: .init(day: 31,  month: 7)),
			Zodiac(sign: .virgo,       startDate: .init(day: 1,  month: 8), endDate: .init(day: 31,  month: 8)),
			Zodiac(sign: .libra,       startDate: .init(day: 1,  month: 9), endDate: .init(day: 30,  month: 9)),
			Zodiac(sign: .scorpio,     startDate: .init(day: 1, month: 10), endDate: .init(day: 31, month: 10)),
			Zodiac(sign: .sagittarius, startDate: .init(day: 1, month: 11), endDate: .init(day: 30, month: 11)),
			Zodiac(sign: .capricorn,   startDate: .init(day: 1, month: 12), endDate: .init(day: 31, month: 12))
		]
		do {
			try validator.validate(zodiacs: customZodiacsInvalid)
		} catch {
			print("### - \(error.localizedDescription)")
		}
		XCTAssertThrowsError(try validator.validate(zodiacs: customZodiacsInvalid))
	}

	/// Invalid list of custom zodiacs - missing days in Jan
	func testCustomZodiacsValidationThrowsErrorMissingDates() {
		let customZodiacsInvalid = [
			Zodiac(sign: .aquarius,    startDate: .init(day: 1,  month: 1), endDate: .init(day: 10,  month: 1)),
			Zodiac(sign: .pisces,      startDate: .init(day: 1,  month: 2), endDate: .init(day: 29,  month: 2)),
			Zodiac(sign: .aries,       startDate: .init(day: 1,  month: 3), endDate: .init(day: 31,  month: 3)),
			Zodiac(sign: .taurus,      startDate: .init(day: 1,  month: 4), endDate: .init(day: 30,  month: 4)),
			Zodiac(sign: .gemini,      startDate: .init(day: 1,  month: 5), endDate: .init(day: 31,  month: 5)),
			Zodiac(sign: .cancer,      startDate: .init(day: 1,  month: 6), endDate: .init(day: 30,  month: 6)),
			Zodiac(sign: .leo,         startDate: .init(day: 1,  month: 7), endDate: .init(day: 31,  month: 7)),
			Zodiac(sign: .virgo,       startDate: .init(day: 1,  month: 8), endDate: .init(day: 31,  month: 8)),
			Zodiac(sign: .libra,       startDate: .init(day: 1,  month: 9), endDate: .init(day: 30,  month: 9)),
			Zodiac(sign: .scorpio,     startDate: .init(day: 1, month: 10), endDate: .init(day: 31, month: 10)),
			Zodiac(sign: .sagittarius, startDate: .init(day: 1, month: 11), endDate: .init(day: 30, month: 11)),
			Zodiac(sign: .capricorn,   startDate: .init(day: 1, month: 12), endDate: .init(day: 31, month: 12))
		]
		do {
			try validator.validate(zodiacs: customZodiacsInvalid)
		} catch {
			print("### - \(error.localizedDescription)")
		}
		XCTAssertThrowsError(try validator.validate(zodiacs: customZodiacsInvalid))
	}

	/// Invalid list of custom zodiacs - missing days in Jan
	func testCustomZodiacsValidationThrowsErrorOverlappingDates() {
		let customZodiacsInvalid = [
			Zodiac(sign: .aquarius,    startDate: .init(day: 1,  month: 1), endDate: .init(day:  1,  month: 2)),
			Zodiac(sign: .pisces,      startDate: .init(day: 1,  month: 2), endDate: .init(day: 29,  month: 2)),
			Zodiac(sign: .aries,       startDate: .init(day: 1,  month: 3), endDate: .init(day: 31,  month: 3)),
			Zodiac(sign: .taurus,      startDate: .init(day: 1,  month: 4), endDate: .init(day: 30,  month: 4)),
			Zodiac(sign: .gemini,      startDate: .init(day: 1,  month: 5), endDate: .init(day: 31,  month: 5)),
			Zodiac(sign: .cancer,      startDate: .init(day: 1,  month: 6), endDate: .init(day: 30,  month: 6)),
			Zodiac(sign: .leo,         startDate: .init(day: 1,  month: 7), endDate: .init(day: 31,  month: 7)),
			Zodiac(sign: .virgo,       startDate: .init(day: 1,  month: 8), endDate: .init(day: 31,  month: 8)),
			Zodiac(sign: .libra,       startDate: .init(day: 1,  month: 9), endDate: .init(day: 30,  month: 9)),
			Zodiac(sign: .scorpio,     startDate: .init(day: 1, month: 10), endDate: .init(day: 31, month: 10)),
			Zodiac(sign: .sagittarius, startDate: .init(day: 1, month: 11), endDate: .init(day: 30, month: 11)),
			Zodiac(sign: .capricorn,   startDate: .init(day: 1, month: 12), endDate: .init(day: 31, month: 12))
		]
		do {
			try validator.validate(zodiacs: customZodiacsInvalid)
		} catch {
			print("### - \(error.localizedDescription)")
		}
		XCTAssertThrowsError(try validator.validate(zodiacs: customZodiacsInvalid))
	}


	// MARK: - helper

	/// Creates a `Date` object with the specified day and month in the year 2000.
	/// - Parameters:
	///   - day: The day value of the date.
	///   - month: The month value of the date.
	/// - Returns: A `Date` object representing the specified day and month in the year 2000.
	private func createDate(day: Int, month: Int) -> Date {
		let calendar = Calendar.current
		let components = DateComponents(year: 2000, month: month, day: day)
		return calendar.date(from: components)!
	}

	/// Tests a specific attribute of the `Sign` enum to ensure its values match the expected values.
	/// - Parameters:
	///   - attributeName: The name of the attribute being tested.
	///   - expectedValues: An array of expected values for the attribute.
	///   - attributeClosure: A closure that represents the attribute's getter.
	func testAttribute<T : Equatable>(attributeName: String, expectedValues: [T], attributeClosure: (Sign) -> T) {
		for (index, sign) in Sign.allCases.enumerated() {
			XCTAssertEqual(attributeClosure(sign), expectedValues[index], "\(attributeName) is incorrect for \(sign.rawValue)")
		}
	}
}
