//
//  ViewController.swift
//  VPlusCoreVideo
//
//  Created by Erwindo Sianipar on 08/02/2023.
//  Copyright (c) 2023 Erwindo Sianipar. All rights reserved.
//

import UIKit
import VPlusCoreVideo

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        VPCoreVideo.authorization = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyYW5kb20iOiJkYzE4ODIzZjU4NDliMTZmIiwidWlkIjo2MzEzODIzNywicmZzIjoxLCJ1c2VybmFtZSI6IjYyODIxODQyMjY0MTNAdmlzaW9ucGx1cy5pZCIsImFiaWxpdGllcyI6W10sImRldmljZV9pZCI6ImFvMWU5Y2c5bG95dXQ2ZnRzbG90cHdwendndXZxYjR2IiwicGwiOiJ3ZWIiLCJjb3VudHJ5IjoiSUQiLCJleHAiOjE2OTQwODcyMDJ9.VbuDTzkM8HZnTde0HSl4Ec2mjDl_JpBYSCOy67bsINw"
        VPCoreVideo.shared.delegate = self
        VPCoreVideo.shared.play()
    }
}

extension ViewController: VPCoreVideoDelegate {
    
    func didVPLimit(message: String) {
        print("didVPLimit", message)
    }
    
    func didVPError(message: String) {
        print("didVPError", message)
    }
}
