//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// Represents a zodiac sign with its date range
public struct WesternZodiac: Codable, Sendable {

	/// The zodiac sign
	public let sign: WesternZodiacSign

	/// The start date range of the zodiac sign
	public let startDate: DateRange

	/// The end date range of the zodiac sign
	public let endDate: DateRange

	/// Represents a date with day and month only
	public struct DateRange: Codable, Sendable{

		/// The day of the date range
		public let day: Int

		/// The month of the date range
		public let month: Int
	}
}
