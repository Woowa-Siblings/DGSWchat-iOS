//
//  ProfileView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Profile View of DGSWchat
struct ProfileView: View {
    
    /// Variables
    @State var data: UserData = UserData(userId: "", nickname: "", grade: 0, room: 0, number: 0)
    @State var posts: [PostData] = [PostData]()
    
    // MARK: - Fetch Profile
    func initProfile() {
        fetchProfile() { response in
            print(String(decoding: response.data!, as: UTF8.self))
            switch response.result {
            case .success:
                guard let value = response.value else { return }
                guard let result = try? JSONDecoder().decode(Response<ProfileData>.self, from: value) else { return }
                withAnimation(.default) {
                    data = result.data.user
                    posts = result.data.post
                }
            case .failure:
                print("error")
            }
        }
    }
    
    var body: some View {
        
        // MARK: - Top Bar
        SWView(title: "프로필") {
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    
                    // MARK: - Profile
                    Image("Sogu")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    VStack(alignment: .leading, spacing: 1) {
                        HStack(spacing: 5) {
                            SWLabel(data.nickname)
                                .font(SWFont.lowtitle)
                            SWLabel("@ \(data.userId)")
                                .font(SWFont.mid)
                                .color(SWColor.gray)
                        }
                        HStack(spacing: 5) {
                            Image("Tag")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 8, height: 8)
                                .foregroundColor(SWColor.main1)
                            SWLabel("\(data.grade)학년 \(data.room)반 \(data.number)번")
                                .font(SWFont.mid)
                                .color(SWColor.main1)
                        }
                    }
                    Spacer()
                    
                    // MARK: - Logout Button
                    Button(action: {
                        removeToken(.accessToken)
                        removeToken(.refreshToken)
                        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            exit(0)
                        }
                    }) {
                        VStack(spacing: 0) {
                            SWLabel("로그아웃")
                                .font(SWFont.chat)
                                .color(SWColor.gray)
                            Rectangle()
                                .fill(SWColor.gray)
                                .frame(width: 27, height: 0.8)
                        }
                    }
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 30)
                
                // MARK: - Posts
                ScrollView {
                    ListView(datas: posts, title: "내가 작성한 질문")
                }
                .refreshable {
                    initProfile()
                }
            }
        }
        .onAppear {
            initProfile()
        }
    }
}
