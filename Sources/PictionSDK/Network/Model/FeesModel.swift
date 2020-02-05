//
//  FeesModel.swift
//  PictionSDK
//
//  Created by jhseo on 2019/11/21.
//  Copyright © 2019 Piction Network. All rights reserved.
//

import Mapper
import Foundation

public typealias FeesViewResponse = FeesModel

public struct FeesModel: Response {
    public let contentsDistributorRate: Double?
    public let userAdoptionPoolRate: Double?
    public let depositPoolRate: Double?
    public let ecosystemFundRate: Double?
    public let supportPoolRate: Double?
    public let translatorRate: Double?
    public let marketerRate: Double?

    public init(map: Mapper) throws {
        contentsDistributorRate = map.optionalFrom("contentsDistributorRate")
        userAdoptionPoolRate = map.optionalFrom("userAdoptionPoolRate")
        depositPoolRate = map.optionalFrom("depositPoolRate")
        ecosystemFundRate = map.optionalFrom("ecosystemFundRate")
        supportPoolRate = map.optionalFrom("supportPoolRate")
        translatorRate = map.optionalFrom("translatorRate")
        marketerRate = map.optionalFrom("marketerRate")
    }

    public func toJSONString() throws -> String {
        return try! toJSON(dict: self.toDict())
    }

    public func toDict() -> [String: Any?] {
        return [
            "contentsDistributorRate": contentsDistributorRate,
            "userAdoptionPoolRate": userAdoptionPoolRate,
            "depositPoolRate": depositPoolRate,
            "ecosystemFundRate": ecosystemFundRate,
            "supportPoolRate": supportPoolRate,
            "translatorRate": translatorRate,
            "marketerRate": marketerRate
        ]
    }
}

extension FeesModel {
    static func sampleData() -> [String: Any] {
        return [
            "contentsDistributorRate": 0,
            "userAdoptionPoolRate": 0,
            "depositPoolRate": 0,
            "ecosystemFundRate": 0,
            "supportPoolRate": 0,
            "translatorRate": 0,
            "marketerRate": 0
        ]
    }
}
