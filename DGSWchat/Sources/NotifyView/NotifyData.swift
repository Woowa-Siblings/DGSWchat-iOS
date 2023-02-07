//
//  NotifyData.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/08.
//

import Foundation

struct NotifyData: Codable, Hashable {
    let postId: Int
    let senderName, commentContent, createDateTime, noticeStatus: String
}

struct AlertData: Codable {
    let noticeStatus: String
}
