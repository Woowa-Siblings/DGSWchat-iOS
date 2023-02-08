//
//  PostView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

struct PostView: View {
    
    /// Variables
    @State var data: PostData
    @State var comments: [CommentData] = [CommentData]()
    @State var commentText: String = ""
    
    func timeParser(_ original: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = formatter.date(from: original
            .components(separatedBy: ".")[0])
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "h:mm"
        return formatter.string(from: date!)
    }
    
    func refresh() {
        getPost(id: data.postId) { response in
            switch response.result {
            case .success:
                guard let value = response.value else { return }
                guard let result = try? JSONDecoder().decode(Response<PostData>.self, from: value) else { return }
                withAnimation(.default) {
                    data = result.data
                }
            case .failure:
                print("error")
            }
        }
    }
    
    func fetchComments() {
        if data.tag.isEmpty {
            refresh()
        }
        getComments(id: data.postId) { response in
            switch response.result {
            case .success:
                guard let value = response.value else { return }
                guard let result = try? JSONDecoder().decode(Response<[CommentData]>.self, from: value) else { return }
                withAnimation(.default) {
                    comments = result.data
                }
            case .failure:
                print("error")
            }
        }
    }
    
    func sendComments() {
        if !commentText.isEmpty {
            sendComment(id: data.postId, content: commentText) { response in
                print(String(decoding: response.data!, as: UTF8.self))
                switch response.result {
                case .success:
                    fetchComments()
                    commentText = ""
                case .failure:
                    print("error")
                }
            }
        }
    }
    
    var body: some View {
        SWView(title: "질문") {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        // MARK: - User Information
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: 0) {
                                Image("Sogu")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 17)
                                    .padding(.trailing, 5)
                                
                                HStack(alignment: .bottom, spacing: 3) {
                                    SWLabel(data.userName)
                                        .font(SWFont.nav)
                                        .color(SWColor.main1)
                                    SWLabel("\(data.grade)학년 \(data.room)반 \(data.number)번")
                                        .font(SWFont.chat)
                                        .color(SWColor.gray)
                                }
                            }
                            .padding(.bottom, 10)
                            
                            // MARK: - Post
                            HStack {
                                SWLabel(data.title)
                                    .font(SWFont.subtitle)
                                    .padding(.bottom, 7)
                                
                                Spacer()
                                SWLabel("#\(extag[data.tag]!)")
                                    .font(SWFont.bold)
                                    .color(SWColor.main1)
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 7)
                                    .background(SWColor.main4)
                                    .clipShape(Capsule())
                            }
                            
                            SWLabel(data.content)
                                .font(SWFont.body)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 12)
                        .background(Color(.systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .elevation()
                        .padding(.bottom, 20)
                        
                        // MARK: - Comments
                        VStack(alignment: .leading, spacing: 15) {
                            ForEach(comments, id: \.self) { comment in
                                VStack(alignment: .leading, spacing: 5) {
                                    HStack(alignment: .bottom, spacing: 3) {
                                        SWLabel(comment.userName)
                                            .font(SWFont.nav)
                                        SWLabel("\(comment.grade)학년 \(comment.room)반 \(comment.number)번")
                                            .font(SWFont.chat)
                                            .color(SWColor.gray)
                                    }
                                    .padding(.leading, 10)
                                    
                                    HStack(alignment: .bottom, spacing: 8) {
                                        SWLabel(comment.content)
                                            .font(SWFont.mid)
                                            .padding(.vertical, 6)
                                            .padding(.horizontal, 12)
                                            .background(SWColor.main5)
                                            .cornerRadius(5, corners: [.topRight, .bottomLeft, .bottomRight])
                                        SWLabel(timeParser(comment.createDateTime))
                                            .font(SWFont.cmt)
                                            .color(SWColor.gray)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 30)
                }
                .refreshable {
                    refresh()
                    fetchComments()
                }
            }
            
            // MARK: - Chat Input
            HStack {
                TextField("질문에 답변 남기기", text: $commentText)
                    .font(SWFont.body)
                    .onSubmit {
                        sendComments()
                    }
                Spacer()
                
                // MARK: - Send Button
                Button(action: sendComments) {
                    Image("Send")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(SWColor.main1)
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
        .onAppear(perform: fetchComments)
    }
}
