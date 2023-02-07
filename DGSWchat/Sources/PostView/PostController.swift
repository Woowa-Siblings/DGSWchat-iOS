//
//  PostController.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation
import Alamofire

// MARK: - Fetch Post
func getPost(id: Int, completion: @escaping (AFDataResponse<Data>) -> Void) {
    AF.request("\(api)/post/read-one/\(id)",
               method: .get,
               encoding: URLEncoding.default,
               headers: ["Content-Type": "application/json"]
    ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            completion(response)
        }
}


// MARK: - Fetch Comments
func getComments(id: Int, completion: @escaping (AFDataResponse<Data>) -> Void) {
    AF.request("\(api)/comment/read/\(id)",
               method: .get,
               encoding: URLEncoding.default,
               headers: ["Content-Type": "application/json"]
    ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            completion(response)
        }
}

// MARK: - Send Comments
func sendComment(id: Int, content: String, completion: @escaping (AFDataResponse<Data>) -> Void) {
    AF.request("\(api)/comment/submit",
               method: .post,
               parameters: ["postId": id,
                            "content": content],
               encoding: JSONEncoding.default,
               headers: ["Content-Type": "application/json"],
               interceptor: Interceptor()
    ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            completion(response)
        }
}
