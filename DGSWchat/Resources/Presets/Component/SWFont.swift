//
//  SWFont.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Font Collection of DGSWchat
enum SWFont {

    // MARK: - Assembles Size and Weight to Font
    static func makeFont(_ size: CGFloat, _ weight: Font.Weight) -> Font {
        return .system(size: size).weight(weight)
    }
}

// MARK: - Extension of SWFont
extension SWFont {
    
    // MARK: - Font Definition
    static let chat: Font       = makeFont(8, .regular)
    static let mid: Font        = makeFont(10, .regular)
    static let bold: Font       = makeFont(10, .semibold)
    static let nav: Font        = makeFont(12, .semibold)
    static let body: Font       = makeFont(12, .regular)
    static let subtitle: Font   = makeFont(14, .semibold)
    static let title: Font      = makeFont(20, .semibold)
}
