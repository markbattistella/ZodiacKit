//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// A protocol representing a zodiac sign.
///
/// Conforming types must support encoding/decoding and be safe for concurrent use.
///
/// This protocol is typically adopted by types representing specific zodiac signs (e.g. Western
/// or Chinese systems), and allows for polymorphic usage.
///
/// Conformance:
/// - `Codable`: Enables serialization to/from external representations (e.g. JSON).
/// - `Sendable`: Ensures safe use across concurrency boundaries (e.g. tasks, actors).
internal protocol ZodiacSign: Codable, Sendable {}
