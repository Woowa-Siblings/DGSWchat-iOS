//
//  NotifyController.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/08.
//

import Foundation
import Alamofire

func checkNotify(completion: @escaping (Bool) -> Void) {
    AF.request("\(api)/notice/check",
               method: .get,
               encoding: URLEncoding.default,
               headers: ["Content-Type": "application/json"],
               interceptor: Interceptor()
    ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            switch response.result {
            case .success:
                guard let value = response.value else { return }
                guard let result = try? JSONDecoder().decode(Response<AlertData>.self, from: value) else { return }
                completion(result.data.noticeStatus == "EXIST")
            case .failure:
                completion(false)
            }
        }
}
