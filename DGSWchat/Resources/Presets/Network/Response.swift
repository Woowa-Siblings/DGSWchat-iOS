//
//  Response.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation

class Response<T: Codable>: Codable {
    var status: Int
    var message: String
    var data: T
}
