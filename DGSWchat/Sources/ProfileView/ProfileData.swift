//
//  ProfileData.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation

struct ProfileData: Codable {
    let user: UserData
    let post: [PostData]
}

struct UserData: Codable {
    let userId, nickname: String
    let grade, room, number: Int
}
