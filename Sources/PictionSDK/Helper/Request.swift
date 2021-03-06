//
//  Request.swift
//  PictionSDK
//
//  Created by jhseo on 21/05/2019.
//  Copyright © 2019 Piction Network. All rights reserved.
//

import Foundation
import Moya
import Mapper

public final class PictionProvider {
    public static func request<M: Mappable, T: TargetType>(_ target: T, success successCompletion: @escaping (M) -> Void, failure failureCompletion: @escaping (ErrorType) -> Void) {
        let provider = MoyaProvider<T>()

        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    try response.filterStatusCode()

                    var item: M
                    if response.data.count == 0 {
                        item = M.from([:])!
                    } else {
                        item = try response.map(to: M.self)
                    }
                    successCompletion(item)
                } catch {
                    if let error = error as? ErrorType {
                        failureCompletion(error)
                    }
                }
            case let .failure(error):
                print("Request Error: \(error)")
            }
        }
    }

    public static func request<M: Mappable, T: TargetType>(_ target: T, success successCompletion: @escaping ([M]) -> Void, failure failureCompletion: @escaping (ErrorType) -> Void) {
        let provider = MoyaProvider<T>()

        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    try response.filterStatusCode()

                    var item: [M]
                    if response.data.count == 0 {
                        item = [M.from([:])!]
                    } else {
                        item = try response.map(to: [M].self)
                    }
                    successCompletion(item)
                } catch {
                    if let error = error as? ErrorType {
                        failureCompletion(error)
                    }
                }
            case let .failure(error):
                print("Request Error: \(error)")
            }
        }
    }
}
