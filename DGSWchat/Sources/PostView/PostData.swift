//
//  PostData.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation

struct CommentData: Codable, Hashable {
    let userId, postId, commentId, grade, room, number: Int
    let userName, createDateTime, content: String
}
