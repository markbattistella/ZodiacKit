//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if canImport(UIKit)
import UIKit

/// A platform-agnostic typealias for color, using `UIColor` on iOS/tvOS/watchOS.
public typealias AgnosticColor = UIColor

#elseif canImport(AppKit)
import AppKit

/// A platform-agnostic typealias for color, using `NSColor` on macOS.
public typealias AgnosticColor = NSColor
#endif

extension AgnosticColor {

    /// Initializes a color from a hexadecimal string.
    ///
    /// Supported formats:
    /// - `#RGB`
    /// - `#RGBA`
    /// - `#RRGGBB`
    /// - `#RRGGBBAA`
    ///
    /// The `#` prefix is optional. Alpha defaults to 1.0 if not provided.
    ///
    /// - Parameter hex: A hexadecimal color string.
    public convenience init?(hex: String) {
        guard let parsedColor = HexColorParser(hex: hex) else { return nil }
        self.init(
            red: parsedColor.red,
            green: parsedColor.green,
            blue: parsedColor.blue,
            alpha: parsedColor.alpha
        )
    }
}

/// A helper struct to parse hexadecimal color strings into RGBA components.
internal struct HexColorParser {

    /// Alpha component of the color (0.0 - 1.0).
    let alpha: CGFloat

    /// Red component of the color (0.0 - 1.0).
    let red: CGFloat

    /// Green component of the color (0.0 - 1.0).
    let green: CGFloat

    /// Blue component of the color (0.0 - 1.0).
    let blue: CGFloat

    /// Parses a hexadecimal color string into its RGBA components.
    ///
    /// Handles both short and full formats, with or without alpha:
    /// - `RGB`, `RGBA`, `RRGGBB`, `RRGGBBAA`
    ///
    /// - Parameter hex: A string containing the hexadecimal color.
    /// - Returns: `nil` if the string is invalid or cannot be parsed.
    init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }

        // Expand shorthand formats like RGB or RGBA to RRGGBB or RRGGBBAA
        if hexString.count == 3 || hexString.count == 4 {
            hexString = hexString.enumerated().map { "\($0.element)\($0.element)" }.joined()
        }

        guard hexString.count == 6 || hexString.count == 8 else { return nil }

        let scanner = Scanner(string: hexString)
        var rgbValue: UInt64 = 0
        guard scanner.scanHexInt64(&rgbValue) else { return nil }

        func normalizeColorComponent(_ component: UInt64) -> CGFloat {
            CGFloat(component) / 255.0
        }

        let alpha = hexString.count == 8 ? (rgbValue >> 24) & 0xFF : 0xFF
        self.alpha = normalizeColorComponent(alpha)
        self.red = normalizeColorComponent((rgbValue >> 16) & 0xFF)
        self.green = normalizeColorComponent((rgbValue >> 8) & 0xFF)
        self.blue = normalizeColorComponent(rgbValue & 0xFF)
    }
}
