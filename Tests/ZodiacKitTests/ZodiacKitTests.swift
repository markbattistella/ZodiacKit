//
//  ZodiacKit
//  Created by Mark Battistella
//

import XCTest
@testable import ZodiacKit

class ZodiacKitTests: XCTestCase {

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

	// -- helper method to create a Date object
	private func createDate(day: Int, month: Int) -> Date {
		let calendar = Calendar.current
		let components = DateComponents(year: 2000, month: month, day: day)
		return calendar.date(from: components)!
	}
}
