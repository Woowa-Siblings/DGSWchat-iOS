//
//  WriteView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Write View of DGSWchat
struct WriteView: View {
    
    /// Variables
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var tag: String = ""
    
    var body: some View {
        SWView(title: "질문하기") {
            VStack(alignment: .leading, spacing: 6) {
                
                // MARK: - Title
                WriteTagView(title: "제목", image: "Pencil")
                TextField("질문의 제목을 입력하세요", text: $title)
                    .font(SWFont.body)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 15)
                    .background(SWColor.lightgray)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(.bottom, 10)
                
                // MARK: - Content
                WriteTagView(title: "내용", image: "Pencil")
                TextField("질문할 내용을 입력하세요", text: $content, axis: .vertical)
                    .font(SWFont.body)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 15)
                    .background(SWColor.lightgray)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(.bottom, 10)
                
                // MARK: - Tag
                WriteTagView(title: "태그 선택", image: "Tag")
                HStack(spacing: 10) {
                    ForEach(["학교", "기술"], id: \.self) { text in
                        Button(action: {
                            tag = text
                        }) {
                            SWLabel("#\(text)")
                                .font(SWFont.bold)
                                .color(tag == text ? SWColor.main1 : SWColor.gray)
                                .padding(.vertical, 3)
                                .padding(.horizontal, 7)
                                .background(tag == text ? SWColor.main4 : SWColor.lightgray)
                                .clipShape(Capsule())
                        }
                    }
                }
                .padding(.leading, 15)
                .padding(.bottom, 25)
                
                SWButton(action: {
                    writePost(title: title, tag: tag, content: content) { response in
                        
                    }
                }, label: "질문 올리기")
                .disabled(title.isEmpty || content.isEmpty || tag.isEmpty)
                .elevation()
                Spacer()
            }
            .padding(.top, 20)
            .padding(.horizontal, 30)
        }
    }
}

// MARK: - Write Tag of DGSWchat
struct WriteTagView: View {
    
    /// Variables
    let title: String
    let image: String
    
    var body: some View {
        HStack(spacing: 7) {
            Image(image)
                .renderingMode(.template)
                .resizable()
                .frame(width: 12, height: 12)
                .foregroundColor(SWColor.main1)
                .padding(.leading, 5)
            SWLabel(title)
                .font(SWFont.nav)
        }
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
