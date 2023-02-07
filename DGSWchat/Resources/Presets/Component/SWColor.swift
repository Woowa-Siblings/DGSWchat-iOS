//
//  SWColor.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Color Collection of DGSWchat
public enum SWColor {
    
    // MARK: - Makes Hexcode to UIColor
    public static func hexToColor(hex: String) -> UIColor {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        return UIColor(red: CGFloat(int >> 16) / 255,
                       green: CGFloat(int >> 8 & 0xFF) / 255,
                       blue: CGFloat(int & 0xFF) / 255,
                       alpha: 1)
    }
    
    // MARK: - Makes Two Hexcodes to Color
    public static func dynamicColor(_ light: String, dark: String? = nil) -> Color {
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
    public static let main1: Color  = dynamicColor("#3D52E3")
    public static let main2: Color  = dynamicColor("#3888FF")
    public static let main3: Color  = dynamicColor("#C3CAFF")
    public static let main4: Color  = dynamicColor("#EBF3FE")
    public static let gray: Color   = dynamicColor("#A3A3A3")
    public static let label: Color  = dynamicColor("#000000", dark: "#FFFFFF")
    public static let shadow: Color = dynamicColor("#b7b7b7", dark: "#000000")
}
