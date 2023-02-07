//
//  ContentView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Main View of DGSWchat
struct MainView: View {
    
    @State var datas: [PostData] = dummydata
    
    // MARK: - Creates Subcell
    func createSubCell(idx: Int, temp: Int) -> some View {
        Group {
            if idx + temp < datas.count {
                MainCellView(data: datas[idx + temp])
            } else { Color.clear.frame(maxWidth: .infinity) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                // MARK: - Chat Banner
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
                                MainCellView(data: datas[idx], bigCell: true)
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
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
