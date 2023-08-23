//
//  NSColor+.swift
//  
//
//  Created by Ken Ishimoto on 2023/08/23.
//

import SwiftUI

#if os(macOS)

extension NSColor {
    
    /// Transform a NSColor into each of the color attributes
    /// - Returns: a tuple with `red`, `green`,  `blue` and `alpha`
    private var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
    
    /// Transform a NSColor into a `rgb` Hex string
    /// - Returns: The hex string.
    public var rgbAsHex: String {
        let redAsInt = Int(round(rgba.red * 255))
        let greenAsInt = Int(round(rgba.green * 255))
        let blueAsInt = Int(round(rgba.blue * 255))
        
        var hexString = String(format: "%02X", redAsInt)
        hexString += String(format: "%02X", greenAsInt)
        hexString += String(format: "%02X", blueAsInt)
        return hexString
    }
    
    /// Transform a NSColor into a `rgba` Hex string
    /// - Returns: The hex string.
    public var rgbaAsHex: String {
        let redAsInt = Int(round(rgba.red * 255))
        let greenAsInt = Int(round(rgba.green * 255))
        let blueAsInt = Int(round(rgba.blue * 255))
        let alphaAsInt = Int(round(rgba.alpha * 255))
        
        var hexString = String(format: "%02X", redAsInt)
        hexString += String(format: "%02X", greenAsInt)
        hexString += String(format: "%02X", blueAsInt)
        hexString += String(format: "%02X", alphaAsInt)
        return hexString
    }
    
    /// Transform a NSColor into a `argb` Hex string
    /// - Returns: The hex string.
    public var argbAsHex: String {
        let redAsInt = Int(round(rgba.red * 255))
        let greenAsInt = Int(round(rgba.green * 255))
        let blueAsInt = Int(round(rgba.blue * 255))
        let alphaAsInt = Int(round(rgba.alpha * 255))
        
        var hexString = String(format: "%02X", alphaAsInt)
        hexString += String(format: "%02X", redAsInt)
        hexString += String(format: "%02X", greenAsInt)
        hexString += String(format: "%02X", blueAsInt)
        return hexString
    }
    
}

#endif
