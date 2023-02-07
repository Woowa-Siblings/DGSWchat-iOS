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
    
    // MARK: - Creates Cell
    func createCell(idx: Int) -> some View {
        Group {
            if idx < datas.count {
                NavigationLink(destination: PostView(data: datas[idx])
                    .navigationBarHidden(true))
                {
                    MainCellView(data: datas[idx], bigCell: true)
                }
            } else { Color.clear.frame(maxWidth: .infinity) }
        }
    }
    
    // MARK: - Creates Subcell
    func createSubCell(idx: Int, temp: Int) -> some View {
        Group {
            if idx + temp < datas.count {
                NavigationLink(destination: PostView(data: datas[idx + temp])
                    .navigationBarHidden(true))
                {
                    MainCellView(data: datas[idx + temp])
                }
            } else { Color.clear.frame(maxWidth: .infinity) }
        }
    }
    
    func initData() {
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
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(SWColor.main1)
                            }
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(SWColor.lightgray)
                        .clipShape(Capsule())
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
                        LazyVStack(alignment: .leading) {
                            HStack {
                                Image("Message")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14)
                                    .foregroundColor(SWColor.gray)
                                
                                SWLabel("모두에게 묻는 질문")
                                    .font(SWFont.nav)
                                    .color(SWColor.gray)
                            }
                            .padding(.top, 5)
                            .padding(.leading, 10)
                            
                            // MARK: - Cells
                            ForEach(0..<datas.count, id: \.self) { idx in
                                if idx % 5 == 0 {
                                    createCell(idx: idx)
                                }
                                
                                // MARK: - Smaller Cells
                                else if idx % 5 == 1 {
                                    VStack(spacing: 10) {
                                        HStack(spacing: 10) {
                                            createSubCell(idx: idx, temp: 0)
                                            createSubCell(idx: idx, temp: 1)
                                        }
                                        HStack(spacing: 10) {
                                            createSubCell(idx: idx, temp: 2)
                                            createSubCell(idx: idx, temp: 3)
                                        }
                                    }
                                }
                            }
                            .elevation()
                        }
                        .padding(.horizontal, 30)
                    }
                }
                
                // MARK: - Plus Button
                NavigationLink(destination: WriteView()
                    .navigationBarHidden(true))
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
        }
        .navigationViewStyle(.stack)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
