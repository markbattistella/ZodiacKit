//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// Represents the system used to define Western zodiac date ranges.
///
/// These systems differ in how zodiac boundaries are calculated — from traditional seasonal
/// divisions to astronomical precision. This enum also supports custom user-defined systems.
public enum WesternZodiacSystem: Codable {

    /// The traditional tropical zodiac system based on the seasons and equinoxes.
    case tropical

    /// The sidereal zodiac system, aligning signs with current star constellations.
    case sidereal

    /// A simplified system where all signs are given equal-length durations.
    case equalLength

    /// A system based on actual International Astronomical Union (IAU) constellation boundaries.
    case astronomicalIAU

    /// A user-defined custom zodiac system using explicit start/end dates.
    case custom([Zodiac])
}

extension WesternZodiacSystem: Equatable, Hashable {

    /// Compares two `WesternZodiacSystem` values for equality.
    ///
    /// - Parameters:
    ///   - lhs: The left-hand side value.
    ///   - rhs: The right-hand side value.
    /// - Returns: `true` if both values represent the same zodiac system, including matching
    /// custom zodiac sets; otherwise, `false`.
    public static func == (lhs: WesternZodiacSystem, rhs: WesternZodiacSystem) -> Bool {
        switch (lhs, rhs) {
            case (.tropical, .tropical),
                (.sidereal, .sidereal),
                (.equalLength, .equalLength),
                (.astronomicalIAU, .astronomicalIAU):
                return true
            case let (.custom(lhsZodiacs), .custom(rhsZodiacs)):
                return lhsZodiacs == rhsZodiacs
            default:
                return false
        }
    }

    // `Hashable` conformance is automatic unless you plan to manually implement `hash(into:)`.
}
