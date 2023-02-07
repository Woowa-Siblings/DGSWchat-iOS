//
//  ChatCellView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/08.
//

import SwiftUI

// MARK: - Chat Cell of ChatView
struct SingleChat: View {
    
    /// Variables
    let chat: Chat
    
    private func dateFormatter(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    var body: some View {
        
        // MARK: - Chat Cell
        HStack(alignment: .bottom, spacing: 8) {
            if chat.isauthor {
                Spacer()
                SWLabel(dateFormatter(chat.time))
                    .color(SWColor.gray)
            }
            VStack(alignment: .leading, spacing: 0) {
                if !chat.isauthor {
                    Image("Sogu")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(.leading, 5)
                }
                SWLabel(chat.message)
                    .makeSelectable()
                    .padding(.vertical, 5)
                    .padding(.horizontal, 12)
                    .background(chat.isauthor ? SWColor.main3 : SWColor.main5)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            
            if !chat.isauthor {
                SWLabel(dateFormatter(chat.time))
                    .color(SWColor.gray)
                Spacer()
            }
        }
        .padding(.bottom, chat.isauthor ? 0 : 15)
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }
}
