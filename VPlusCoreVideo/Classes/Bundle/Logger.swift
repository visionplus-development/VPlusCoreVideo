//
//  Logger.swift
//  VPlusCoreVideo
//
//  Created by ERWINDO SIANIPAR on 08/08/2023.
//

class VPLogger {
    
    static func log(value: Any) {
        if VPCoreVideo.env == .development {
            print(value)
        }
    }
}
