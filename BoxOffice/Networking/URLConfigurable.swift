//
//  URLConfigurable.swift
//  BoxOffice
//
//  Created by nayeon  on 2/19/24.
//

import Foundation

protocol URLConfigurable {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    
    func configureURL() -> URL?
}

extension URLConfigurable {
    func configureURL() -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
