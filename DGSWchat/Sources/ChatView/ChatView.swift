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
    @State private var chats: [Chat] = [Chat]()
    @State private var input: String = ""
    
    // MARK: - Sending Chat
    private func send() {
        makeChat(message: input, isauthor: true)
        sendMessage(message: input) { response in
            switch response.result {
            case .success:
                guard let value = response.value else { return }
                guard let result = try? JSONDecoder().decode(ChatData.self, from: value) else { return }
                var final = result.result.text
                if [".", "?", "!", ",", "요"].contains(final.first) {
                    final = String(final.dropFirst())
                }
                makeChat(message: final, isauthor: false)
            case .failure:
                print("실패")
            }
            input = ""
            withAnimation(.default) {
                chats = getChat()
            }
        }
    }
    
    var body: some View {
        SWView(title: "소구") {
            VStack(spacing: 0) {
                ScrollViewReader { value in
                    
                    // MARK: - Chat Scroll View
                    ScrollView {
                        ForEach(0..<chats.count, id: \.self) { idx in
                            
                            // MARK: - Chat Cell
                            SingleChat(chat: chats[idx])
                                .id(idx)
                                .onChange(of: chats.count) { _ in
                                    withAnimation(.default) {
                                        value.scrollTo(chats.count - 1)
                                    }
                                }
                                .onAppear {
                                    value.scrollTo(chats.count - 1)
                                }
                        }
                        .padding(30)
                    }
                    .onAppear {
                        chats = getChat()
                    }
                }
                
                // MARK: - Chat Input
                HStack {
                    TextField("우리의 친구 소구에게 물어보세요.", text: $input)
                        .font(SWFont.body)
                        .onSubmit {
                            send()
                        }
                    Spacer()
                    
                    // MARK: - Send Button
                    Button(action: send) {
                        Image("Send")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(SWColor.gray)
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .background(SWColor.lightgray)
                .clipShape(Capsule())
                .padding(.top, 5)
                .padding(.bottom, 15)
                .padding(.horizontal, 30)
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

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
