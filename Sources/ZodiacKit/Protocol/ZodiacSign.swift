//
// Project: 
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

protocol ZodiacSign: CaseIterable, Codable, RawRepresentable where RawValue == String {
    var name: String { get }
    var emoji: String { get }
}
