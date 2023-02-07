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

var dummydata: [Chat] {
    var temp = [Chat]()
    for i in 0..<60 {
        var temp2 = Chat()
        temp2.message = "\(i)번째 메시지dawfnjo2ithn2io3qwjfqiofkmwtj32n4kfjemwnf wke,mf"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let dateString = "2.7.2023 10:\(i)"
        let date = dateFormatter.date(from: dateString)
        temp2.time = date!
        temp2.isauthor = i % 2 == 0
        temp.append(temp2)
    }
    return temp
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
