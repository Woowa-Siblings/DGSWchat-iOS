//
//  ChatDataManager.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation
import RealmSwift

func makeChat(message: String, isauthor: Bool) {
    let realm = try! Realm()
    let temp = Chat()
    temp.message = message
    temp.time = Date()
    temp.isauthor = isauthor
    try! realm.write {
        realm.add(temp)
    }
}

func getChat() -> [Chat] {
    let realm = try! Realm()
    let realmResults = realm.objects(Chat.self)
    return Array(realmResults)
}
