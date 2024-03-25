//
//  ZodiacKit
//  Created by Mark Battistella
//

import Foundation

/// Contains the default set of Western Zodiac signs and their associated date ranges.
/// These defaults are used by `ZodiacService` if no custom zodiacs are provided.
public let defaultZodiacs: [WesternZodiac] = [
	WesternZodiac(
		sign: .aquarius,
		startDate: .init(day: 20, month: 1),
		endDate: .init(day: 18, month: 2)
	),
	WesternZodiac(
		sign: .pisces,
		startDate: .init(day: 19, month: 2),
		endDate: .init(day: 20, month: 3)
	),

	WesternZodiac(
		sign: .aries,
		startDate: .init(day: 21, month: 3),
		endDate: .init(day: 19, month: 4)
	),

	WesternZodiac(
		sign: .taurus,
		startDate: .init(day: 20, month: 4),
		endDate: .init(day: 20, month: 5)
	),

	WesternZodiac(
		sign: .gemini,
		startDate: .init(day: 21, month: 5),
		endDate: .init(day: 20, month: 6)
	),

	WesternZodiac(
		sign: .cancer,
		startDate: .init(day: 21, month: 6),
		endDate: .init(day: 22, month: 7)
	),

	WesternZodiac(
		sign: .leo,
		startDate: .init(day: 23, month: 7),
		endDate: .init(day: 22, month: 8)
	),

	WesternZodiac(
		sign: .virgo,
		startDate: .init(day: 23, month: 8),
		endDate: .init(day: 22, month: 9)
	),

	WesternZodiac(
		sign: .libra,
		startDate: .init(day: 23, month: 9),
		endDate: .init(day: 22, month: 10)
	),

	WesternZodiac(
		sign: .scorpio,
		startDate: .init(day: 23, month: 10),
		endDate: .init(day: 21, month: 11)
	),

	WesternZodiac(
		sign: .sagittarius,
		startDate: .init(day: 22, month: 11),
		endDate: .init(day: 21, month: 12)
	),

	WesternZodiac(
		sign: .capricorn,
		startDate: .init(day: 22, month: 12),
		endDate: .init(day: 19, month: 1)
	)
]
