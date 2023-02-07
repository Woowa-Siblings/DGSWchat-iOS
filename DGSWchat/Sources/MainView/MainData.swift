//
//  MainData.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation

struct PostData: Codable {
    let tag, createDateTime, content, userName, title: String
    let postId, grade, room, number, author: Int
}
