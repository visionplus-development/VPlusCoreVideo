//
//  AppDelegate.swift
//  VPlusCoreVideo
//
//  Created by Erwindo Sianipar on 08/02/2023.
//  Copyright (c) 2023 Erwindo Sianipar. All rights reserved.
//

import UIKit
import netfox
import VPlusCoreVideo

@UIApplicationMain
class AppDelegate: UIResponder {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let url = "https://example.com"
        VPCoreVideo.shared.initSDK(config: VPConfig(environment: .development, url: url, deviceID: "ABCD123"))
        
        NFX.sharedInstance().start()
        
        return true
    }
}

extension AppDelegate: UIApplicationDelegate {
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
}
