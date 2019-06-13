//
//  ProjectViewResponse.swift
//  PictionSDK
//
//  Created by jhseo on 30/05/2019.
//  Copyright © 2019 Piction Network. All rights reserved.
//

import Mapper

public struct ProjectViewResponse: Mappable {
    public let created_at: String?
    public let id: String?
    public let synopsis: String?
    public let thumbnail: String?
    public let title: String?
    public let uri: String?
    public let wideThumbnail: String?

    public init(map: Mapper) throws {
        created_at = map.optionalFrom("created_at")
        id = map.optionalFrom("id")
        synopsis = map.optionalFrom("synopsis")
        thumbnail = map.optionalFrom("thumbnail")
        title = map.optionalFrom("title")
        uri = map.optionalFrom("uri")
        wideThumbnail = map.optionalFrom("wideThumbnail")
    }
}

extension ProjectViewResponse {
    static func sampleData() -> [String: Any] {
        return [
            "created_at": "created_at",
            "id": "id",
            "synopsis": "synopsis",
            "thumbnail": "thumbnail",
            "title": "title",
            "url": "url",
            "wideThumbnail": "wideThumbnail"
        ]
    }
}
