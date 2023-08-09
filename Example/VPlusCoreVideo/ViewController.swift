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
        
        VPCoreVideo.authorization = "ABCD123"
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
