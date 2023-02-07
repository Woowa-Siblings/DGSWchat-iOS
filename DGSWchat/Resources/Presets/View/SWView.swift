//
//  SWView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Custom View of DGSWchat
struct SWView<Content: View>: View {
    
    @Environment(\.dismiss) private var dismiss
    
    /// Variables
    let title: String
    let content: Content

    /// Initializer
    init(title: String,
         @ViewBuilder content: () -> Content)
    {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        
        // MARK: - Main View
        VStack(spacing: 0) {
            HStack {
                
                // MARK: - Dismiss Button
                Button(action: {
                    dismiss()
                }) {
                    Image("Left")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 7)
                        .foregroundColor(SWColor.gray)
                }
                Spacer()
                
                // MARK: - Title
                SWLabel(title)
                    .font(SWFont.nav)
                    .color(SWColor.gray)
                    .frame(height: 40)
                Spacer()
            }
            .padding(.horizontal, 24)
            
            // MARK: - Divider
            Rectangle()
                .fill(SWColor.lightgray)
                .frame(height: 1)
            content
        }
    }
}
