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

let dummydata: [PostData] = [
    PostData(tag: "Tech",
             createDateTime: "2023-02-07T09:04:43.729Z",
             content: "안녕",
             userName: "이석호",
             title: "안녕1",
             postId: 1, grade: 2, room: 3, number: 11, author: 1),
    PostData(tag: "Tech",
             createDateTime: "2023-02-07T09:04:43.729Z",
             content: "안녕",
             userName: "이석호",
             title: "안녕2",
             postId: 1, grade: 2, room: 3, number: 11, author: 1),
    PostData(tag: "Tech",
             createDateTime: "2023-02-07T09:04:43.729Z",
             content: "안녕",
             userName: "이석호",
             title: "안녕3",
             postId: 1, grade: 2, room: 3, number: 11, author: 1),
    PostData(tag: "Tech",
             createDateTime: "2023-02-07T09:04:43.729Z",
             content: "안녕",
             userName: "이석호",
             title: "안녕4",
             postId: 1, grade: 2, room: 3, number: 11, author: 1),
    PostData(tag: "Tech",
             createDateTime: "2023-02-07T09:04:43.729Z",
             content: "안녕",
             userName: "이석호",
             title: "안녕5",
             postId: 1, grade: 2, room: 3, number: 11, author: 1),
    PostData(tag: "Tech",
             createDateTime: "2023-02-07T09:04:43.729Z",
             content: "안녕",
             userName: "이석호",
             title: "안녕6",
             postId: 1, grade: 2, room: 3, number: 11, author: 1),
    PostData(tag: "Tech",
             createDateTime: "2023-02-07T09:04:43.729Z",
             content: "안녕",
             userName: "이석호",
             title: "안녕7",
             postId: 1, grade: 2, room: 3, number: 11, author: 1),
    PostData(tag: "Tech",
             createDateTime: "2023-02-07T09:04:43.729Z",
             content: "안녕",
             userName: "이석호",
             title: "안녕8",
             postId: 1, grade: 2, room: 3, number: 11, author: 1),
    PostData(tag: "Tech",
             createDateTime: "2023-02-07T09:04:43.729Z",
             content: "안녕",
             userName: "이석호",
             title: "안녕9",
             postId: 1, grade: 2, room: 3, number: 11, author: 1)
]
//{
//  "status": 0,
//  "message": "string",
//  "data": [
//    {
//      "tag": "Tech",
//      "createDateTime": "2023-02-07T09:04:43.729Z",
//      "content": "string",
//      "postId": 0,
//      "userName": "string",
//      "grade": 0,
//      "room": 0,
//      "number": 0,
//      "author": 0
//    }
//  ]
//}
