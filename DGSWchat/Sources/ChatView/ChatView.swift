//
//  ChatView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Chat View of DGSWchat
struct ChatView: View {
    
    /// Variables
    @State var chats: [Chat] = dummydata
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { value in
                
                // MARK: - Chat Scroll View
                ScrollView {
                    LazyVStack {
                        ForEach(0..<chats.count, id: \.self) { idx in
                            
                            // MARK: - Chat Cell
                            SingleChat(chat: chats[idx])
                                .id(idx)
                                .onChange(of: chats) { _ in
                                    withAnimation(.default) {
                                        value.scrollTo(chats.count - 1)
                                    }
                                }
                        }
                    }
                    .padding(30)
                }
                .onAppear {
                    value.scrollTo(chats.count - 1)
                }
            }
            HStack {
                
            }
        }
    }
}

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
                    Image("Person")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.leading, 10)
                }
                SWLabel(chat.message)
                    .padding(.vertical, 8)
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
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
