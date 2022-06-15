//
//  MovieList.swift
//  iOSMovieApp
//
//  Created by 박현우 on 2022/06/15.
//

import Foundation
import Alamofire

class MovieList {
    func getMovieList() {
        let url = "https://openapi.naver.com/v1/search/movie.json?query=%EC%A3%BC%EC%8B%9D&display=10&start=1&genre=1"
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "rEMQnbLOpQcPKX5lgZf4",
            "X-Naver-Client-Secret": "6BhYa_dxJq"
        ]
        
        AF.request(url, headers: headers)
            .responseData { [weak self] response in
                guard let self = self else { return }
                
                switch response.result {
                case .success:
                    if let jsonData = response.value {
                        let decoder = JSONDecoder()
                        
                        guard let movieListData = try? decoder.decode(MovieListData.self, from: jsonData) else { return }
                        
                        print(movieListData.items)
                    }
                case let .failure(error):
                    print(error)
                }
            }
    }
}
