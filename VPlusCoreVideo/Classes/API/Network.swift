//
//  Network.swift
//  Alamofire
//
//  Created by ERWINDO SIANIPAR on 02/08/2023.
//

import Alamofire

public struct APIResponse: Decodable {
    let url: String
}

public class NET {
    
    public init() {}
    
    public func fetch(completion: @escaping (Result<APIResponse, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            AF.request(
                "https://postman-echo.com/get",
                method: .get
            ).responseDecodable(of: APIResponse.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
