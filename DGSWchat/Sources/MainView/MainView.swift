//
//  ContentView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Main View of DGSWchat
struct MainView: View {
    
    /// Variables
    @State private var searchText: String = ""
    @State private var datas: [PostData] = [PostData]()
    @State private var isNotification: Bool = true

    func initData() {
        checkNotify() { status in
            isNotification = status
        }
        getPosts() { response in
            switch response.result {
            case .success:
                guard let value = response.value else { return }
                guard let result = try? JSONDecoder().decode(Response<[PostData]>.self, from: value) else { return }
                withAnimation(.default) {
                    datas = result.data
                }
            case .failure:
                print("error")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 0) {
                    
                    // MARK: - Upper Bar
                    HStack(spacing: 5) {
                        NavigationLink(destination: ProfileView()
                            .navigationBarHidden(true))
                        {
                            Image("Profile")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 17)
                                .foregroundColor(SWColor.gray)
                        }
                        
                        // MARK: - Search Input
                        HStack {
                            TextField("키워드로 검색하기", text: $searchText)
                                .font(SWFont.body)
                            Spacer()
                            
                            // MARK: - Send Button
                            Button(action: {
                            }) {
                                Image("Search")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(SWColor.main1)
                            }
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(SWColor.lightgray)
                        .clipShape(Capsule())
                        
                        // MARK: - Notify
                        NavigationLink(destination: NotifyView()
                            .onAppear {
                                isNotification = false
                            }
                            .navigationBarHidden(true)) {
                                ZStack(alignment: .topTrailing) {
                                    Image("Bell")
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(SWColor.gray)
                                    if isNotification {
                                        Circle()
                                            .fill(SWColor.main1)
                                            .frame(width: 4, height: 4)
                                    }
                                }
                            }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 30)
                    
                    // MARK: - Chat Banner
                    NavigationLink(destination: ChatView()
                        .navigationBarHidden(true))
                    {
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
                        .padding(.bottom, 10)
                        .elevation()
                        .padding(.horizontal, 30)
                    }
                    
                    ScrollView {
                        ListView(datas: datas, title: "모두에게 묻는 질문")
                    }
                    .refreshable {
                        initData()
                    }
                }
                
                // MARK: - Plus Button
                NavigationLink(destination: WriteView()
                    .navigationBarHidden(true)
                    .onDisappear(perform: initData))
                {
                    Image("Plus")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(SWColor.main1)
                        .clipShape(Circle())
                }
                .padding(.trailing, 30)
                .padding(.bottom, 20)
                .elevation()
            }
            .onAppear(perform: initData)
            .onTapGesture {
                checkNotify() { status in
                    isNotification = status
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
