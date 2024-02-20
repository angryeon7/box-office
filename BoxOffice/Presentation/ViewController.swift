//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//
import UIKit

class ViewController: UIViewController {
    
    // NetworkManager 인스턴스 생성
    var networkManager: NetworkManaging
    
    init(networkManager: NetworkManaging = NetworkManager() as! NetworkManaging) {
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromNetwork()
    }
    
    func fetchDataFromNetwork() {
        let testDate = "202402119"
        let testMovieCode = "20217807"
        
        let urlType: URLConfigurable = URLType.movieInformation(movieCode: testMovieCode)
        
        networkManager.fetchData(urlType: urlType, method: .get, responseType: MovieInformation.self) { [weak self] result in
            switch result {
            case .success(let movieInformation):
                // 데이터 가져오기 성공 시, 디코딩된 데이터를 출력
                print("Received movie information: \(movieInformation)")
            case .requestErr(let errorData):
                print("Request error: \(errorData)")
            case .pathErr:
                print("Path error")
            case .serverErr:
                print("Server error")
            case .networkFail:
                print("Network error")
            }
        }
    }
}
