//
//  NetworkError.swift
//  BoxOffice
//
//  Created by nayeon  on 2/16/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case networkFailed
    case dataFailed
    
    public var networkErrorDescription: String {
        switch self {
        case .invalidURL:
            return "유효하지 않은 URL입니다."
        case .invalidResponse:
            return "서버로부터의 응답이 유효하지 않습니다."
        case .networkFailed:
            return "네트워크 요청이 실패했습니다."
        case .dataFailed:
            return "서버에서 데이터를 가져오는 데 실패했습니다."
        }
    }
}
