//
//  SWLabel.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Custom Label of DGSWchat
struct SWLabel: View {
    
    /// Variables
    let text: String
    var color: Color
    var font: Font
    var selectable: Bool
    
    /// Initializer
    init(_ text: String,
         color: Color = SWColor.label,
         font: Font = SWFont.body,
         selectable: Bool = false)
    {
        self.text = text
        self.color = color
        self.font = font
        self.selectable = selectable
    }
    
    var body: some View {
        
        // MARK: - Main Text
        Text(text)
            .foregroundColor(color)
            .font(font)
            .if(selectable) {
                $0.textSelection(.enabled)
            }
    }
}

// MARK: - Function Extensions of SWLabel
extension SWLabel {
    
    // MARK: - Color Function
    func color(_ color: Color) -> SWLabel {
        SWLabel(self.text,
                color: color,
                font: self.font,
                selectable: self.selectable)
    }
    
    // MARK: - Font Function
    func font(_ font: Font) -> SWLabel {
        SWLabel(self.text,
                color: self.color,
                font: font,
                selectable: self.selectable)
    }
    
    // MARK: - Selectable Function
    func makeSelectable() -> SWLabel {
        SWLabel(self.text,
                color: self.color,
                font: self.font,
                selectable: true)
    }
}
