//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// A protocol to conform `WesternZodiacSign` and `ChineseZodiacSign`.
protocol ZodiacSign: CaseIterable, Codable, RawRepresentable where RawValue == String {

    /// Requires a name
    var name: String { get }

    /// Requires an emoji
    var emoji: String { get }
}
