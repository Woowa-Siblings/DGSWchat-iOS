//
//  OnboardingController.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation
import Alamofire
import CryptoKit

// MARK: - Fetch Login Code
func login(loginId: String, loginPw: String, completion: @escaping (AFDataResponse<Data>) -> Void) {
    AF.request("\(api)/auth/login",
               method: .post,
               parameters: ["userId": loginId, "password":
                                SHA512.hash(data: loginPw.data(using: .utf8)!)
                .compactMap{ String(format: "%02x", $0) }.joined().uppercased()],
               encoding: JSONEncoding.default,
               headers: ["Content-Type": "application/json"]
    ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            completion(response)
        }
}

// MARK: - Decode DAuth Code
func decodeCode(_ response: AFDataResponse<Data>) -> String {
    let result = try! JSONDecoder().decode(CodeData.self, from: response.value!)
    return result.data
}

// MARK: - Start Auth
func fetchAuth(code: String, completion: @escaping (AFDataResponse<Data>) -> Void) {
    AF.request("\(api)/auth/token",
               method: .post,
               parameters: ["authCode": code],
               encoding: JSONEncoding.default,
               headers: ["Content-Type": "application/json"]
    ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            completion(response)
        }
}

// MARK: - Complete Auth
func completeAuth(_ response: AFDataResponse<Data>) {
    let result = try! JSONDecoder().decode(Response<AuthData>.self, from: response.value!)
    
    saveToken(.accessToken, result.data.accessToken)
    saveToken(.refreshToken, result.data.refreshToken)
}
