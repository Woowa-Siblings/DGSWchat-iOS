//
//  LoginData.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation

struct CodeData: Codable {
    let name: String
    let profileImage: String?
    let location: String
}

struct AuthData: Codable {
    let accessToken: String
    let refreshToken: String
}
