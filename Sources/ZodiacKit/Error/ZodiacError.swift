//
//  ZodiacKit
//  Created by Mark Battistella
//

import Foundation

/// Errors that can be thrown during the validation and retrieval of zodiac signs
public enum ZodiacError: Error {

	/// Thrown when the data is invalid
	case invalidData

	/// Thrown when date calculation fails
	case dateCalculationError

	/// Thrown when there are overlapping dates in the zodiacs
	case overlappingDates

	/// Thrown when there are missing dates in the zodiacs
	case missingDates(missingDates: [DateComponents])

	/// Thrown when there are duplicated zodiac signs in the zodiacs
	case duplicatedZodiac

	/// Thrown when there are missing zodiac signs in the zodiacs
	case missingZodiac

    /// Thrown when the Western date is converted to Chinese date is not in the full format
    case incorrectDateFormat
}


/// Custom error messages for the `ZodiacError` errors
extension ZodiacError: LocalizedError {

	/// The localized description of the error.
	public var errorDescription: String? {

		switch self {
			case .invalidData:
				return NSLocalizedString(
					"Invalid data.",
					comment: "ZodiacError - invalidData"
				)

			case .dateCalculationError:
				return NSLocalizedString(
					"Date calculation error.",
					comment: "ZodiacError - dateCalculationError"
				)

			case .overlappingDates:
				return NSLocalizedString(
					"Overlapping dates in the zodiacs.",
					comment: "ZodiacError - overlappingDates"
				)

			case .missingDates:
				return NSLocalizedString(
					"Missing dates in the zodiacs.",
					comment: "ZodiacError - missingDates"
				)

			case .duplicatedZodiac:
				return NSLocalizedString(
					"Duplicated zodiac signs in the zodiacs.",
					comment: "ZodiacError - duplicatedZodiac"
				)

			case .missingZodiac:
				return NSLocalizedString(
					"Missing zodiac signs in the zodiacs.",
					comment: "ZodiacError - missingZodiac"
				)

            case .incorrectDateFormat:
                return NSLocalizedString(
                    "Date is not in the full format for proper conversion.",
                    comment: "ZodiacError - incorrectDateFormat"
                )
		}
	}
}
