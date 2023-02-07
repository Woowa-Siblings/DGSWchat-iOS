//
//  ChatData.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation
import RealmSwift

class Chat: Object {
    @objc dynamic var isauthor: Bool = true
    @objc dynamic var time: Date = Date()
    @objc dynamic var message: String = String()
}

struct ChatData: Codable {
    let status: ChatStatus
    let result: ChatResult
}

struct ChatStatus: Codable {
    let code, message: String
    let messageVariables: [String: String]?
}

struct ChatResult: Codable {
    let text, stopReason: String
    let inputLength, outputLength: Int
    let inputTokens, outputTokens: [String]?
    let ok: Bool
    let probs: [String]?
    let aiFilter: Int?
    
}
