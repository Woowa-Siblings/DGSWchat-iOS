//
//  ListView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/08.
//

import SwiftUI


struct ListView: View {
    
    /// Variables
    let datas: [PostData]
    let title: String
    
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
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            HStack {
                Image("Message")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14)
                    .foregroundColor(SWColor.gray)
                
                SWLabel(title)
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
