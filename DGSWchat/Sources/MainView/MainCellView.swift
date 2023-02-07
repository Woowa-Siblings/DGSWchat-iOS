//
//  MainCell.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Main Cell View of DGSWchat
struct MainCellView: View {
    
    /// Variables
    var bigCell: Bool?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            // MARK: - Main Cell
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    
                    // MARK: - Student Info
                    VStack(alignment: .leading) {
                        SWLabel("김경민")
                            .font(SWFont.mid)
                        SWLabel("1학년 1반 18번")
                            .font(SWFont.chat)
                            .color(SWColor.gray)
                    }
                    .padding(.leading, bigCell != nil ? 12 : 5)
                    Spacer()
                    
                    // MARK: - Tag
                    SWLabel("#기술")
                        .font(SWFont.bold)
                        .color(SWColor.main1)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 7)
                        .background(SWColor.main4)
                        .clipShape(Capsule())
                }
                .padding(.bottom, 7)
                
                // MARK: - Content
                SWLabel("글입니다")
                    .font(SWFont.body)
                    .padding(.bottom, 3)
                Text("글일수도 있고 아닐수도 있습니다. 글일수도 있고 아닐수도 있습니다. 글일수도 있고 아닐수도 있습니다. 글일수도 있고 아닐수도 있습니다. ")
                    .lineLimit(3)
                    .font(SWFont.mid)
                Spacer()
            }
            .padding(10)
            
            // MARK: - Overlay
            if bigCell != nil {
                Image("Overlay")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .foregroundColor(SWColor.main1)
            }
        }
        .frame(height: 102)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .elevation()
    }
}
