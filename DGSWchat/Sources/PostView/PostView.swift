//
//  PostView.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

struct PostView: View {
    
    /// Variables
    @State var data: PostData
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(data: PostData(tag: "Tech", createDateTime: "", content: "dawfw", userName: "dd", title: "d", postId: 1, grade: 1, room: 1, number: 1, author: 1))
    }
}
