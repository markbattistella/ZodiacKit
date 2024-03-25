//
//  ZodiacKit
//  Created by Mark Battistella
//

import Foundation

/// Protocol for validating an array of zodiacs
public protocol Validator {

	/// Validate the provided zodiacs
	///
	/// - Parameter zodiacs: Array of zodiacs to be validated
	/// - Throws: `ZodiacError` if zodiacs are invalid
	func validate(zodiacs: [WesternZodiac]) throws
}
