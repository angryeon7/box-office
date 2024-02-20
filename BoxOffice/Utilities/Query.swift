//
//  Query.swift
//  BoxOffice
//
//  Created by nayeon  on 2/19/24.
//

import Foundation

struct Query {
    static let key = URLQueryItem(name: "key", value: "2fa5866e3c329a53afad886b2f90601c")
    static var date: URLQueryItem?
    static var movieCode: URLQueryItem?

    static func selectDate(_ date: String) -> URLQueryItem {
        return URLQueryItem(name: "targetDt", value: date)
    }

    static func selectMovieCode(_ code: String) -> URLQueryItem {
        return URLQueryItem(name: "movieCd", value: code)
    }
}
