//
//  OnboardingData.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation

struct CodeData: Codable {
    var status: Int
    var message: String
    var data: String
}

struct AuthData: Codable {
    let accessToken: String
    let refreshToken: String
}
