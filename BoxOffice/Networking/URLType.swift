//
//  URLType.swift
//  BoxOffice
//
//  Created by nayeon  on 2/18/24.
//

import Foundation

enum URLType {
    case boxOfficeData
    case movieInformation(movieCode: String)
}

extension URLType: URLConfigurable {
    var scheme: String {
        return "http"
    }
    
    var host: String {
        return "kobis.or.kr"
    }
    
    var path: String {
        switch self {
        case .boxOfficeData:
            return "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        case .movieInformation:
            return "/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .boxOfficeData:
            return [Query.key, Query.date].compactMap { $0 }
        case .movieInformation(let movieCode):
            return [Query.key, Query.selectMovieCode(movieCode)].compactMap { $0 }
        }
    }
}
