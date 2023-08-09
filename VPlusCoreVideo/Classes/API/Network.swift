//
//  Network.swift
//  Alamofire
//
//  Created by ERWINDO SIANIPAR on 02/08/2023.
//

import Alamofire

struct APIResponse: Decodable {
    let message: String
}

class VPNetwork {
    
    public static func concurrentPlay(completion: @escaping(DataResponse<APIResponse, AFError>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let headers: HTTPHeaders = [
                .init(name: "device-id", value: VPCoreVideo.deviceID),
                .init(name: "Authorization", value: VPCoreVideo.authorization)
            ]
            AF.request(VPCoreVideo.url, method: .get, headers: headers).validate().responseDecodable(of: APIResponse.self) { response in
                completion(response)
            }
        }
    }
}
