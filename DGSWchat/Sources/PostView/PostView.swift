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
    
    var body: some View {
        SWView(title: "질문") {
            ScrollView {
                VStack {
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
                    .elevation()
                }
                .padding(.top, 20)
                .padding(.horizontal, 30)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(data: PostData(tag: "Tech", createDateTime: "", content: "dawefj230f2ewfoifkm3mlrmevmfdvn34o2fewklmwfw", userName: "이석호", title: "d", postId: 1, grade: 1, room: 1, number: 1, author: 1))
    }
}
