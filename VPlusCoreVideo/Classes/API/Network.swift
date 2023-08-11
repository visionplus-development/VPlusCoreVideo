//
//  Network.swift
//  Alamofire
//
//  Created by ERWINDO SIANIPAR on 02/08/2023.
//

struct APIResponse: Decodable {
    let message: String
}

class VPNetwork {
    
    public static func concurrentPlay(completion: @escaping (Result<APIResponse, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            guard let url = URL(string: VPCoreVideo.url) else {
                completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
                return
            }
            
            var request = URLRequest(url: url)
            configureRequest(&request)
            
            performDataTask(with: request, completion: completion)
        }
    }
    
    private static func configureRequest(_ request: inout URLRequest) {
        request.httpMethod = "GET"
        request.addValue(VPCoreVideo.deviceID, forHTTPHeaderField: "device-id")
        request.addValue(VPCoreVideo.authorization, forHTTPHeaderField: "Authorization")
    }
    
    private static func performDataTask(with request: URLRequest, completion: @escaping (Result<APIResponse, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let invalidResponseError = NSError(domain: "Invalid HTTP Response", code: -1, userInfo: nil)
                completion(.failure(invalidResponseError))
                return
            }
            
            handleResponse(data: data, httpResponse: httpResponse, completion: completion)
        }
        
        task.resume()
    }
    
    private static func handleResponse(data: Data?, httpResponse: HTTPURLResponse, completion: @escaping (Result<APIResponse, Error>) -> Void) {
        do {
            if (200..<300).contains(httpResponse.statusCode) {
                let value = try JSONDecoder().decode(APIResponse.self, from: data ?? Data())
                completion(.success(value))
            } else {
                let value = try JSONDecoder().decode(APIResponse.self, from: data ?? Data())
                let httpError = NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: ["value": value])
                completion(.failure(httpError))
            }
        } catch {
            completion(.failure(error))
        }
    }
}
