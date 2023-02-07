//
//  SWFont.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Font Collection of DGSWchat
public enum SWFont {

    // MARK: - Assembles Size and Weight to Font
    public static func makeFont(_ size: CGFloat, _ weight: Font.Weight) -> Font {
        return .system(size: size).weight(weight)
    }
}

// MARK: - Extension of SWFont
extension SWFont {
    
    // MARK: - Font Definition
    public static let body: Font  = makeFont(12, .regular)
    public static let title: Font = makeFont(20, .semibold)
}
