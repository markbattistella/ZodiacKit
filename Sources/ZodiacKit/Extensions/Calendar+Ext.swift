//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// Internal extension to provide commonly used calendar instances.
internal extension Calendar {

    /// A Gregorian calendar instance configured to use GMT (UTC) timezone.
    ///
    /// Useful for consistent date calculations that do not depend on the user's local time zone.
    static let gregorian = Calendar(identifier: .gregorian).settingGMT()
}

private extension Calendar {

    /// Returns a copy of the calendar with its time zone set to GMT (UTC).
    ///
    /// This ensures date calculations remain consistent regardless of the user's local time zone.
    /// - Returns: A `Calendar` instance with the time zone set to GMT.
    func settingGMT() -> Calendar {
        var calendar = self
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar
    }
}
