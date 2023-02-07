//
//  LoginController.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation
import Alamofire
import CryptoKit

// MARK: - Fetch DAuth Code
func fetchCode(loginId: String, loginPw: String, completion: @escaping (AFDataResponse<Data>) -> Void) {
    AF.request("http://dauth.b1nd.com/api/auth/login",
               method: .post,
               parameters: ["id": loginId, "pw":
                                SHA512.hash(data: loginPw.data(using: .utf8)!)
                .compactMap{ String(format: "%02x", $0) }.joined(),
                            "clientId": "1e44744df8d3440faaeb222981f43fe366ff9d9447a245a2b44a78f322f95cc5",
                            "redirectUrl": "http://localhost:3000/callback",
                            "state": "null"
                           ],
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
    let result = try! JSONDecoder().decode(Response<CodeData>.self, from: response.value!)
    return result.data.location.components(separatedBy: ["=", "&"])[1]
}

// MARK: - Start Auth
func fetchAuth(code: String, completion: @escaping (AFDataResponse<Data>) -> Void) {
    AF.request("\(api)/auth/code",
               method: .post,
               parameters: ["code": code],
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
