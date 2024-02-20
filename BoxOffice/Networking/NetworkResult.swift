//
//  NetworkResult.swift
//  BoxOffice
//
//  Created by nayeon  on 2/19/24.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
