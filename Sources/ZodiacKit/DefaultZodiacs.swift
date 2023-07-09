//
//  ZodiacKit
//  Created by Mark Battistella
//

import Foundation

/// The default zodiacs used if no zodiacs are provided during the initialization of `ZodiacService`
public let defaultZodiacs: [Zodiac] = [
	Zodiac(
		sign: .aquarius,
		startDate: .init(day: 20, month: 1),
		endDate: .init(day: 18, month: 2)
	),
	Zodiac(
		sign: .pisces,
		startDate: .init(day: 19, month: 2),
		endDate: .init(day: 20, month: 3)
	),

	Zodiac(
		sign: .aries,
		startDate: .init(day: 21, month: 3),
		endDate: .init(day: 19, month: 4)
	),

	Zodiac(
		sign: .taurus,
		startDate: .init(day: 20, month: 4),
		endDate: .init(day: 20, month: 5)
	),

	Zodiac(
		sign: .gemini,
		startDate: .init(day: 21, month: 5),
		endDate: .init(day: 20, month: 6)
	),

	Zodiac(
		sign: .cancer,
		startDate: .init(day: 21, month: 6),
		endDate: .init(day: 22, month: 7)
	),

	Zodiac(
		sign: .leo,
		startDate: .init(day: 23, month: 7),
		endDate: .init(day: 22, month: 8)
	),

	Zodiac(
		sign: .virgo,
		startDate: .init(day: 23, month: 8),
		endDate: .init(day: 22, month: 9)
	),

	Zodiac(
		sign: .libra,
		startDate: .init(day: 23, month: 9),
		endDate: .init(day: 22, month: 10)
	),

	Zodiac(
		sign: .scorpio,
		startDate: .init(day: 23, month: 10),
		endDate: .init(day: 21, month: 11)
	),

	Zodiac(
		sign: .sagittarius,
		startDate: .init(day: 22, month: 11),
		endDate: .init(day: 21, month: 12)
	),

	Zodiac(
		sign: .capricorn,
		startDate: .init(day: 22, month: 12),
		endDate: .init(day: 19, month: 1)
	)
]
