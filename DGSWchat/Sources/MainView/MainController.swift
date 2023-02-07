//
//  MainController.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation
import Alamofire

// MARK: - Fetch Login Code
func getPosts(completion: @escaping (AFDataResponse<Data>) -> Void) {
    AF.request("\(api)/post/read-all",
               method: .get,
               encoding: URLEncoding.default,
               headers: ["Content-Type": "application/json"]
    ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            completion(response)
        }
}
