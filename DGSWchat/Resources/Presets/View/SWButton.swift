//
//  SWButton.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Large Button of DGSWchat
public struct SWButton: View {
    
    /// Variables
    public let action: () -> Void
    public let label: String
    public var disabled: Bool = false
    
    /// Initializer
    public init(action: @escaping () -> Void,
                label: String,
                disabled: Bool = false)
    {
        self.action = action
        self.label = label
        self.disabled = disabled
    }
    
    public var body: some View {
        
        // MARK: - Main Button
        Button(action: action) {
            SWLabel(label)
                .font(SWFont.body)
                .color(.white)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(disabled ? SWColor.main3 : SWColor.main1)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .disabled(disabled)
    }
}

// MARK: - Function Extensions of SWButton
extension SWButton {
    
    // MARK: - Disabled Function
    public func disabled(_ disabled: Bool) -> SWButton {
        SWButton(action: self.action,
                 label: self.label,
                 disabled: disabled)
    }
}
