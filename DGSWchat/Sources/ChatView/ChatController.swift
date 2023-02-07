//
//  ChatController.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation
import Alamofire

// MARK: - Fetch DAuth Code
func sendMessage(message: String, completion: @escaping (AFDataResponse<Data>) -> Void) {
    AF.request("https://clovastudio.apigw.ntruss.com/testapp/v1/tasks/x56jxyz7/completions/LK-B",
               method: .post,
               parameters: ["topK": 4,
                            "includeProbs": false,
                            "includeTokens": false,
                            "restart": "",
                            "includeAiFilters": false,
                            "maxTokens": 300,
                            "temperature": 1,
                            "start": "",
                            "stopBefore": [ "<|endoftext|>" ],
                            "text": message,
                            "repeatPenalty": 5.0,
                            "topP": 0.8
                           ],
               encoding: JSONEncoding.default,
               headers: ["X-NCP-CLOVASTUDIO-API-KEY": "NTA0MjU2MWZlZTcxNDJiYww/kvlcoJaQ9o9OIoKgWPNm4Kk2IulkOXm6cuAFPH9cWwNpe/dKCcwMGw6bxbeRGu7C8STSlFfIFt6f1jpJYveV42Y2xQDb9WoJGImKH/aVKMHY4+8kI2SBExlzBlYcpf72cOdlqTA7PoIWtY4bAHWnW3rLwIkHkvK0y5LBJqZJqAzMucM19oD/U8HHwS0piA==",
                         "X-NCP-APIGW-API-KEY": "x9WThyFLS7vsayryhK0r744NcuVW78b0aAzGIMUw",
                         "X-NCP-CLOVASTUDIO-REQUEST-ID": "679a9e5e32aa4235be4648902ea54f32",
                         "Content-Type": "application/json"]
    ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            print(String(decoding: response.data!, as: UTF8.self))
            completion(response)
        }
}
