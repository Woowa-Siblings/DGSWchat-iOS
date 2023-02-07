//
//  Interceptor.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation
import Alamofire

struct InterceptorData: Codable {
    let accessToken: String
}

// MARK: - Alamofire Interceptor of DGSWchat
final class Interceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard urlRequest.url?.absoluteString.hasPrefix(api) == true,
              let accessToken = getToken(.accessToken) else {
                  completion(.success(urlRequest))
                  return
              }
        var urlRequest = urlRequest
        urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        completion(.success(urlRequest))
    }
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }
        AF.request("\(api)/auth/refreshToken",
                   method: .get,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type": "application/json",
                             "Authorization": "Bearer \(getToken(.refreshToken)!)"]
        ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            switch response.result {
            case .success:
                let decoder: JSONDecoder = JSONDecoder()
                guard let value = response.value else { return }
                guard let result = try? decoder.decode(Response<InterceptorData>.self, from: value) else { return }
                saveToken(.accessToken, result.data.accessToken)
                completion(.retry)
            case .failure(let error):
                print("통신 오류!\nCode:\(error._code), Message: \(error.errorDescription!)")
                removeToken(.accessToken)
                removeToken(.refreshToken)
                completion(.doNotRetryWithError(error))
                exit(0)
            }
        }
    }
}
