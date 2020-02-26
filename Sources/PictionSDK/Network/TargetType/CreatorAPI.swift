//
//  CreatorAPI..swift
//  PictionSDK
//
//  Created by jhseo on 14/01/2020.
//  Copyright © 2019 Piction Network. All rights reserved.
//

import Foundation
import Moya

public enum CreatorAPI {
    case projects
    case posts(uri: String, seriesId: Int? = nil, condition: String? = nil, membershipLevel: Int? = nil, page: Int, size: Int)
    case projectSponsors(uri: String, membershipId: Int? = nil, page: Int, size: Int)
    case projectsCount
    case sales(salesYear: Int, salesMonth: Int)
}

extension CreatorAPI: TargetType {
    public var baseURL: URL { return URL(string: ServerInfo.baseApiUrl)! }
    public var path: String {
        switch self {
        case .projects:
            return "/my/projects"
        case .posts(let uri, _, _, _, _, _):
            return "/my/projects/\(uri)/posts"
        case .projectSponsors(let uri, _, _, _):
            return "/my/projects/\(uri)/sponsors"
        case .projectsCount:
            return "/my/projects/count"
        case .sales:
            return "/my/sales"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .projects,
             .posts,
             .projectSponsors,
             .projectsCount,
             .sales:
            return .get
        }
    }
    public var sampleData: Data {
        switch self {
        case .projects:
            return jsonSerializedUTF8(json: [ProjectViewResponse.sampleData()])
        case .posts:
            return jsonSerializedUTF8(json: PageViewResponse<PostModel>.sampleData())
        case .projectSponsors:
            return jsonSerializedUTF8(json: PageViewResponse<SponsorModel>.sampleData())
        case .projectsCount:
            return jsonSerializedUTF8(json: DefaultViewResponse.sampleData())
        case .sales:
            return jsonSerializedUTF8(json: [SalesViewResponse.sampleData()])
        }
    }
    public var task: Task {
        switch self {
        case .projects,
             .projectsCount:
            return .requestPlain
        case .posts(_, let seriesId, let condition, let membershipLevel, let page, let size):
            var param: [String: Any] = [:]
            param["page"] = page
            param["size"] = size
            if seriesId != nil {
                param["seriesId"] = seriesId
            }
            if condition != nil {
                param["condition"] = condition
            }
            if membershipLevel != nil {
                param["membershipLevel"] = membershipLevel
            }
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .projectSponsors(_, let membershipId, let page, let size):
            var param: [String: Any] = [:]
            param["page"] = page
            param["size"] = size
            if membershipId != nil {
                param["membershipId"] = membershipId
            }
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .sales(let salesYear, let salesMonth):
            var param: [String: Any] = [:]
            param["salesYear"] = salesYear
            param["salesMonth"] = salesMonth
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }
    public var headers: [String: String]? {
        return ServerInfo.getCustomHeader()
    }
}
