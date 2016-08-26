//
//  UserDefaultsManager.swift
//  MapsTest
//
//  Created by Nikita Gorely on 8/26/16.
//  Copyright © 2016 Nikita Gorely. All rights reserved.
//

import UIKit

enum MapProviderType : Int {
    
    case NativeMapKitProvider = 0, SKMapProvider
    
}

enum ServiceProviderType : Int {
    
    case NominatimProvider = 0, GoogleProvider
    
}

class UserDefaultsManager: NSObject {

    static let sharedInstance = UserDefaultsManager()
    
    
    // MARK: Public Methods
    
    func setMapProviderType(type : MapProviderType) {
        
        self.setByStandartDefaults(type.rawValue, forKey: Constants.mapProviderKey)
        
    }
    
    func setServiceProviderType (type : ServiceProviderType) {
       
        self.setByStandartDefaults(type.rawValue, forKey: Constants.serviceProviderKey)
        
    }
    
    func getMapProviderType() -> MapProviderType {
        
        return MapProviderType(rawValue: self.getByStandartUserDefaults(Constants.mapProviderKey))!
        
    }
    
    func getServiceProviderType() -> ServiceProviderType{
        
        return ServiceProviderType(rawValue: self.getByStandartUserDefaults(Constants.serviceProviderKey))!
        
    }
    
    
    // MARK: Private Methods
    
    private func setByStandartDefaults (value : Int , forKey : String) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(value, forKey: forKey)
        defaults.synchronize()
        
    }
    
    private func getByStandartUserDefaults (forKey : String) -> Int {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.integerForKey(forKey)
        
    }
    
}
