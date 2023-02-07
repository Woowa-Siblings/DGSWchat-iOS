//
//  SWLabel.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Custom Label of DGSWchat
public struct SWLabel: View {
    
    /// Variables
    public let text: String
    public var color: Color
    public var font: Font
    
    /// Initializer
    public init(_ text: String,
                color: Color = SWColor.label,
                font: Font = SWFont.body)
    {
        self.text = text
        self.color = color
        self.font = font
    }
    
    public var body: some View {
        
        // MARK: - Main Text
        Text(text)
            .foregroundColor(color)
            .font(font)
    }
}

// MARK: - Function Extensions of SWLabel
extension SWLabel {
    
    // MARK: - Color Function
    public func color(_ color: Color) -> SWLabel {
        SWLabel(self.text,
                color: color,
                font: self.font)
    }
    
    // MARK: - Font Function
    public func font(_ font: Font) -> SWLabel {
        SWLabel(self.text,
                color: self.color,
                font: font)
    }
}
