//
//  NotifyView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Notify View of DGSWchat
struct NotifyView: View {
    
    /// Variables
    @State private var datas: [NotifyData] = [NotifyData]()
    
    // MARK: - Fetch Notification
    func initNotify() {
        fetchNotify() { response in
            switch response.result {
            case .success:
                guard let value = response.value else { return }
                guard let result = try? JSONDecoder().decode(Response<[NotifyData]>.self, from: value) else { return }
                withAnimation(.default) {
                    datas = result.data
                }
            case .failure:
                print("error")
            }
        }
    }
    
    var body: some View {
        SWView(title: "알림") {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(datas, id: \.self) { data in
                        
                        // MARK: - Notify Cell
                        NavigationLink(destination: PostView(data: PostData(tag: "",
                                                                            createDateTime: "",
                                                                            content: "",
                                                                            userName: "",
                                                                            title: "",
                                                                            postId: data.postId,
                                                                            grade: 0,
                                                                            room: 0,
                                                                            number: 0,
                                                                            author: 0))
                            .navigationBarHidden(true)) {
                                ZStack(alignment: .topLeading) {
                                    
                                    // MARK: - Main Cell
                                    VStack(alignment: .leading, spacing: 5) {
                                        HStack(spacing: 0) {
                                            SWLabel(data.senderName)
                                                .font(SWFont.bold)
                                            SWLabel("님이 회원님의 질문에 답변을 남겼습니다. ")
                                                .font(SWFont.mid)
                                            Spacer()
                                        }
                                        SWLabel("\"\(data.commentContent)\"")
                                            .font(SWFont.mid)
                                    }
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 25)
                                    
                                    // MARK: - Overlay
                                    Image("Overlay")
                                        .renderingMode(.template)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .foregroundColor(SWColor.main1)
                                }
                                .frame(height: 49)
                                .background(Color(.systemBackground))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .elevation()
                            }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 20)
                .frame(maxWidth: .infinity)
            }
            .refreshable {
                initNotify()
            }
        }
        .onAppear(perform: initNotify)
    }
}
