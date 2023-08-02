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
        
        NET().fetch(completion: { response in
            switch response {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        })
    }
}
