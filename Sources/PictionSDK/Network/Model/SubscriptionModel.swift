//
//  SubscriptionModel.swift
//  PictionSDK
//
//  Created by jhseo on 20/06/2019.
//  Copyright © 2019 Piction Network. All rights reserved.
//

import Foundation
import Mapper

public typealias SubscriptionViewResponse = SubscriptionModel

public struct SubscriptionModel: Response {
    public let expireDate: Date?
    public let subscribing: Bool?

    public init(map: Mapper) throws {
        expireDate = map.optionalFrom("expireDate")
        subscribing = map.optionalFrom("subscribing")
    }

    public func toJSONString() throws -> String {
        return try! toJSON(dict: self.toDict())
    }

    public func toDict() -> [String: Any?] {
        return [
            "expireDate": expireDate?.toString(format: "YYYY-MM-dd'T'HH:mm:ssZ"),
            "subscribing": subscribing
        ]
    }
}

extension SubscriptionModel {
    static func sampleData() -> [String: Any] {
        return [
            "expireDate": "2019-06-20T09:27:53.127+0000",
            "subscribing": false
        ]
    }
}
