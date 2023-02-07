//
//  ProfileView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        SWView(title: "프로필") {
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    Image("Sogu")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    VStack(alignment: .leading, spacing: 1) {
                        HStack(spacing: 5) {
                            SWLabel("최희건")
                                .font(SWFont.lowtitle)
                            SWLabel("@asdkwqf")
                                .font(SWFont.mid)
                                .color(SWColor.gray)
                        }
                        HStack(spacing: 5) {
                            Image("Tag")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 8, height: 8)
                                .foregroundColor(SWColor.main1)
                            SWLabel("@asdkwqf")
                                .font(SWFont.mid)
                                .color(SWColor.main1)
                        }
                    }
                    Spacer()
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
                .padding(.top, 20)
                .padding(.horizontal, 30)
                ScrollView {
                    
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
