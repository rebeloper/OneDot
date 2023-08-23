//
//  Color+.swift
//
//
//  Created by Alex Nagy on 22.08.2023.
//

import SwiftUI

public extension Color {
    
    /// Color from HEX
    /// - Parameter hex: HEX
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
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
