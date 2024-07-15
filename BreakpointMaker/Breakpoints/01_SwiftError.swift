//
//  01_SwiftError.swift
//  BreakpointMaker
//
//  Created by junely on 7/9/24.
//

import UIKit

struct Hive: Equatable, Codable {
    
    let brand: Brand
    let base: [HiveModule]
    var moreChoice: [HiveModule]
    
    enum Brand: String, Codable {
        case c2s                            = "C2S"
        case v1                             = "V1"
        case v4                             = "V4"
    }
    
    enum HiveModule: String, Codable {
        case core                           = "HiveCore"
        case service                        = "HiveService"
        case `protocol`                     = "HiveProtocol"
        case iapV4                          = "HiveIAPV4"
        case extensions                     = "HiveExtensions"
        case ui                             = "HiveUI"
        case appsTrackingTransparency       = "HiveAppsTrackingTransparency"
        case realNameVerification           = "HiveRealNameVerification"
        case promotion                      = "HivePromotion"
        case deviceManagement               = "HiveDeviceManagement"
        case iapV4Repayment                 = "HiveIAPV4Repayment"
        case dataStore                      = "HiveDataStore"
        case analyticsConsentMode           = "HiveAnalyticsConsentMode"
        case authV4ProviderAppleSignIn      = "HiveAuthV4ProviderApple"
        case authV4ProviderAppleGameCenter  = "HiveAuthV4ProviderAppleGameCenter"
        case authV4ProviderGoogle           = "HiveAuthV4ProviderGoogle"
        case authV4ProviderFacebook         = "HiveAuthV4ProviderFacebook"
        case authV4ProviderHive             = "HiveAuthV4ProviderHive"
        case authV4ProviderLine             = "HiveAuthV4ProviderLine"
        case authV4ProviderWeverse          = "HiveAuthV4ProviderWeverse"
        case authV4ProviderWechat           = "HiveAuthV4ProviderWechat"
        case authV4ProviderVK               = "HiveAuthV4ProviderVK"
        case authV4ProviderQQ               = "HiveAuthV4ProviderQQ"
        case analyticsProviderAdjust        = "HiveAnalyticsProviderAdjust"
        case analyticsProviderAppsFlyer     = "HiveAnalyticsProviderAppsFlyer"
        case analyticsProviderFirebase      = "HiveAnalyticsProviderFirebase"
        case analyticsProviderSingular      = "HiveAnalyticsProviderSingular"
        
    }
    
}

extension ViewController {
    
    @objc
    func throwError() {
        let typoedString = """
        {
            "brand": "v4",
            "base": [
                "HiveCore", "HiveService", "HiveProtocol"
            ],
            "moreChoice": [
                "HiveIAPV4", "HivePromotion"
            ]
        }
        """
        
        if let _ = decodeHive(from: typoedString) {
            print("I am Hive user")
        }
    }
    
    func decodeHive(from myHiveSdkString: String) -> Hive? {
        guard let myHiveSdkData = myHiveSdkString.data(using: .utf8),
              let myHive = try? JSONDecoder().decode(Hive.self, from: myHiveSdkData) else {
            return nil
        }
        
        return myHive
    }
    
}
