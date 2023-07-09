//
//  ZodiacKit
//  Created by Mark Battistella
//

import Foundation

/// Retrieves zodiac sign from a date
public struct ZodiacService {

	private let zodiacs: [Zodiac]
	private let validator = ZodiacDateValidator()
	private let dayOfYearToZodiac: [Int: Sign]

	/// Initializes the `ZodiacService` with an array of zodiacs. The default zodiacs are used if not provided.
	/// - Parameters:
	///   - zodiacs: Optional array of `Zodiac`. Default value is `defaultZodiacs`
	/// - Throws: Throws any error from `ZodiacValidator.validate(zodiacs:)` method
	public init(zodiacs: [Zodiac] = defaultZodiacs) throws {
		try validator.validate(zodiacs: zodiacs)
		self.zodiacs = zodiacs
		var map: [Int: Sign] = [:]  // Changed to a dictionary
		for zodiac in zodiacs {
			let startDate = zodiac.startDate
			let startDayOfYear = try validator.dayOfYear(day: startDate.day, month: startDate.month)
			let endDate = zodiac.endDate
			let endDayOfYear = try validator.dayOfYear(day: endDate.day, month: endDate.month)
			if startDayOfYear <= endDayOfYear {
				for day in startDayOfYear...endDayOfYear {
					map[day] = zodiac.sign
				}
			} else {  // Handle wrapping at end of year
				for day in startDayOfYear...365 {
					map[day] = zodiac.sign
				}
				for day in 1...endDayOfYear {
					map[day] = zodiac.sign
				}
			}
		}
		self.dayOfYearToZodiac = map
	}

	/// Returns the zodiac sign for a given date
	/// - Parameters:
	///   - date: The date for which the zodiac sign is needed
	/// - Throws: `ZodiacError.dateCalculationError` if the day of the year can't be calculated from the date
	/// - Returns: Zodiac `Sign` for the given date
	public func getZodiac(from date: Date) throws -> Sign {
		let calendar = Calendar.current
		guard let dayOfYear = calendar.ordinality(of: .day, in: .year, for: date),
			  let zodiacSign = dayOfYearToZodiac[dayOfYear] else {
			throw ZodiacError.dateCalculationError
		}
		return zodiacSign
	}
}
