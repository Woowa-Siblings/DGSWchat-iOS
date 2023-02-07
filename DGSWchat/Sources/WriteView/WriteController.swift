//
//  WriteController.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation
import Alamofire

// MARK: - Fetch DAuth Code
func writePost(title: String, tag: String, content: String, completion: @escaping (AFDataResponse<Data>) -> Void) {
    AF.request("\(api)/post/submit",
               method: .post,
               parameters: ["title": title,
                            "tag": ["학교": "School", "기술": "Tech"][tag]!,
                            "content": content],
               encoding: JSONEncoding.default,
               headers: ["Content-Type": "application/json"],
               interceptor: Interceptor()
    ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            print(String(decoding: response.data!, as: UTF8.self))
            completion(response)
        }
}
