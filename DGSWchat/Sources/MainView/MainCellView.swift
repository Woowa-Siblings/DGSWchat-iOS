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
    let data: PostData
    var bigCell: Bool?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            // MARK: - Main Cell
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    
                    // MARK: - Student Info
                    VStack(alignment: .leading) {
                        SWLabel(data.userName)
                            .font(SWFont.mid)
                        SWLabel("\(data.grade)학년 \(data.room)반 \(data.number)번")
                            .font(SWFont.chat)
                            .color(SWColor.gray)
                    }
                    .padding(.leading, bigCell != nil ? 12 : 5)
                    Spacer()
                    
                    // MARK: - Tag
                    SWLabel("#\(extag[data.tag]!)")
                        .font(SWFont.bold)
                        .color(SWColor.main1)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 7)
                        .background(SWColor.main4)
                        .clipShape(Capsule())
                }
                .padding(.bottom, 7)
                
                // MARK: - Content
                SWLabel(data.title)
                    .font(SWFont.body)
                    .padding(.bottom, 3)
                Text(data.content)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
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
    }
}
