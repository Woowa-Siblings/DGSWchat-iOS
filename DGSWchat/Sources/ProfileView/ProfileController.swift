//
//  ProfileController.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation
import Alamofire

// MARK: - Fetch Profile
func fetchProfile(completion: @escaping (AFDataResponse<Data>) -> Void) {
    AF.request("\(api)/auth/myProfile",
               method: .get,
               encoding: URLEncoding.default,
               headers: ["Content-Type": "application/json"],
               interceptor: Interceptor()
    ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            completion(response)
        }
}
