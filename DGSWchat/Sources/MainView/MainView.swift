//
//  ContentView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Main View of DGSWchat
struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ChatView().navigationBarHidden(true)) {
                    HStack {
                        Image("Sogu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                        Spacer()
                        SWLabel("인공지능 소구와 이야기하기")
                            .color(.white)
                        Image("Left")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 5)
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(180))
                    }
                    .padding(.vertical, 18)
                    .padding(.horizontal, 20)
                    .background(SWColor.main1)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .elevation()
                }
            }
            .padding(30)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
