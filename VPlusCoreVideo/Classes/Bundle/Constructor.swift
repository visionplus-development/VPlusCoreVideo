//
//  Constructor.swift
//  VPlusCoreVideo
//
//  Created by ERWINDO SIANIPAR on 08/08/2023.
//

import Alamofire

public enum VPEnvironment {
    case production
    case development
}

public struct VPConfig {
    public let environment: VPEnvironment
    public let url: String
    public let deviceID: String
    
    public init(environment: VPEnvironment, url: String, deviceID: String) {
        self.environment = environment
        self.url = url
        self.deviceID = deviceID
    }
}

public protocol VPCoreVideoDelegate {
    func didVPLimit(message: String)
    func didVPError(message: String)
}

public class VPCoreVideo {
    
    public static let shared = VPCoreVideo()
    public static var authorization = String()
    
    public var delegate: VPCoreVideoDelegate?
    
    static var env: VPEnvironment = .development
    static var url = String()
    static var deviceID = String()
    
    public func initSDK(config: VPConfig) {
        VPCoreVideo.env = config.environment
        VPCoreVideo.url = config.url
        VPCoreVideo.deviceID = config.deviceID
    }
    
    public func play() {
        VPTimer.delegate = self
        VPTimer.start()
    }
    
    public func stop() {
        VPTimer.stop()
    }
}

extension VPCoreVideo: VPTimerDelegate {
    
    func timerEvent() {
        VPNetwork.concurrentPlay(completion: { response in
            switch response.result {
            case .success(let value):
                VPLogger.log(value: value)
            case .failure(let error):
                VPLogger.log(value: error)
                VPTimer.stop()
                if let data = response.data, error.responseCode == 403 {
                    do {
                        let value = try JSONDecoder().decode(APIResponse.self, from: data)
                        self.delegate?.didVPLimit(message: value.message)
                    } catch {
                        self.delegate?.didVPError(message: error.localizedDescription)
                    }
                } else {
                    self.delegate?.didVPError(message: error.localizedDescription)
                }
            }
        })
    }
}
