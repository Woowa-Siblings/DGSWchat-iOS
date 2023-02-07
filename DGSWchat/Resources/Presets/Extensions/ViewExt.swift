//
//  ViewExt.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Function Extensions of View
extension View {
    
    @ViewBuilder func elevation() -> some View {
        self
            .shadow(color: SWColor.shadow.opacity(0.5), radius: 8, x: 2, y: 4)
            .zIndex(1)
    }
}
