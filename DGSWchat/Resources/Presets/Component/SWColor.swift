//
//  SWColor.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Color Collection of DGSWchat
enum SWColor {
    
    // MARK: - Makes Hexcode to UIColor
    static func hexToColor(hex: String) -> UIColor {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        return UIColor(red: CGFloat(int >> 16) / 255,
                       green: CGFloat(int >> 8 & 0xFF) / 255,
                       blue: CGFloat(int & 0xFF) / 255,
                       alpha: 1)
    }
    
    // MARK: - Makes Two Hexcodes to Color
    static func dynamicColor(_ light: String, dark: String? = nil) -> Color {
        let lightColor = hexToColor(hex: light)
        if dark == nil {
            return Color(lightColor)
        } else {
            let darkColor = hexToColor(hex: dark!)
            return Color(UIColor { $0.userInterfaceStyle == .dark ? darkColor : lightColor })
        }
    }
}

// MARK: - Extension of SWColor
extension SWColor {
    
    // MARK: - Color Definition
    static let main1: Color     = dynamicColor("#3D52E3")
    static let main2: Color     = dynamicColor("#3888FF")
    static let main3: Color     = dynamicColor("#C3CAFF")
    static let main4: Color     = dynamicColor("#EBF3FE")
    static let main5: Color     = dynamicColor("#F2F6FF")
    static let gray: Color      = dynamicColor("#A3A3A3")
    static let lightgray: Color = dynamicColor("#F2F2F2")
    static let label: Color     = dynamicColor("#000000", dark: "#FFFFFF")
    static let shadow: Color    = dynamicColor("#b7b7b7", dark: "#000000")
}
