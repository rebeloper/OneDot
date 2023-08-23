//
//  Color+.swift
//
//
//  Created by Alex Nagy on 22.08.2023.
//

import SwiftUI

public extension Color {
    
    /// Color from HEX
    /// Example : `FAB`, `#FAB`, `FFAACC`, `#FFAACC`, `FFAACC11` or `#FFAACC11`
    /// - Parameter hex: HEX RGB (12-bit), RGB (24-bit) or ARGB (32-bit)
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)

        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (rgbValue >> 8) * 17, (rgbValue >> 4 & 0xF) * 17, (rgbValue & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, rgbValue >> 16, rgbValue >> 8 & 0xFF, rgbValue & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (rgbValue >> 24, rgbValue >> 16 & 0xFF, rgbValue >> 8 & 0xFF, rgbValue & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255
        )
    }
    
}

public extension Color {
    
    /// Random color
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

public extension Color {

#if os(tvOS) || os(iOS) || os(watchOS)
    
    /// Transform a UIColor into a `rgb` Hex string
    /// - Returns: The hex string.
    var rgbAsHex: String {
        return UIColor(self).rgbAsHex
    }
    
    /// Transform a UIColor into a `rgba` Hex string
    /// - Returns: The hex string.
    var rgbaAsHex: String {
        return UIColor(self).rgbaAsHex
    }
    
    /// Transform a UIColor into a `argb` Hex string
    /// - Returns: The hex string.
    var argbAsHex: String {
        return UIColor(self).argbAsHex
    }
    
#elseif os(macOS)

    /// Transform a UIColor into a `rgb` Hex string
    /// - Returns: The hex string.
    var rgbAsHex: String {
        return NSColor(self).rgbAsHex
    }
    
    /// Transform a UIColor into a `rgba` Hex string
    /// - Returns: The hex string.
    var rgbaAsHex: String {
        return NSColor(self).rgbaAsHex
    }
    
    /// Transform a UIColor into a `argb` Hex string
    /// - Returns: The hex string.
    var argbAsHex: String {
        return NSColor(self).argbAsHex
    }

#endif

}
