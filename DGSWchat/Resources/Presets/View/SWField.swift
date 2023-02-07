//
//  SWField.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

enum FieldType {
    case normal
    case secure
}

// MARK: - TextField of DGSWchat
struct SWField: View {
    
    /// Bindings
    @Binding var text: String
    
    /// Variables
    @FocusState private var focus: Bool
    var type: FieldType?
    
    public var body: some View {
        
        // MARK: - Main Field
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            
            HStack(spacing: 10) {
                
                // MARK: - Placeholder Image
                Image(type == .secure ? "Lock" : "Person")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 14, height: 14)
                    .foregroundColor(text.count > 0 ? SWColor.main1 : SWColor.gray)
                
                // MARK: - Text Field
                switch(type) {
                case .secure:
                    SecureField("비밀번호를 입력하세요.", text: $text)
                        .focused($focus)
                default:
                    TextField("아이디를 입력하세요.", text: $text)
                        .focused($focus)
                        .autocapitalization(.none)
                }
            }
            
            // MARK: - Line
            Rectangle()
                .fill(focus ? SWColor.main1 : SWColor.gray)
                .frame(height: 1)
                .padding(.top, 10)
        }
        .font(SWFont.body)
        .frame(height: 14)
    }
}
