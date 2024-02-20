//
//  NetworkManager.swift
//  BoxOffice
//
//  Created by nayeon  on 2/18/24.
//

import Foundation

protocol NetworkManaging {
    func fetchData<T: Decodable>(urlType: URLConfigurable, method: HTTPMethod, responseType: T.Type, completion: @escaping (NetworkResult<T>) -> Void)
}

class NetworkManager {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchData<T: Decodable>(urlType: URLType, method: HTTPMethod = .get, responseType: T.Type, completion: @escaping (NetworkResult<T>) -> Void) {
        guard let url = urlType.configureURL() else {
            completion(.networkFail)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        performRequest(request, responseType: responseType, completion: completion)
    }
    
    private func performRequest<T: Decodable>( _ request: URLRequest, responseType: T.Type, completion: @escaping (NetworkResult<T>) -> Void) {
        let task = urlSession.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.networkFail)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.networkFail)
                return
            }
            
            switch self.judgeStatus(by: httpResponse.statusCode, data: data, responseType: responseType) {
            case .success(let decodedData):
                completion(.success(decodedData))
            case .pathErr:
                completion(.pathErr)
            case .serverErr:
                completion(.serverErr)
            case .networkFail:
                completion(.networkFail)
            default:
                completion(.networkFail)
            }
        }
        
        task.resume()
    }
    
    private func judgeStatus<T: Decodable>(by statusCode: Int, data: Data, responseType: T.Type) -> NetworkResult<T> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(responseType.self, from: data) else {
            return .pathErr
        }

        switch statusCode {
        case 200..<300: return .success(decodedData)
        case 400..<500: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
