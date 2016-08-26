//
//  ReverseGeocodingManager.swift
//  MapsTest
//
//  Created by Nikita Gorely on 8/26/16.
//  Copyright © 2016 Nikita Gorely. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapKit

class ReverseGeocodingManager: NSObject {

    static let sharedInstance = ReverseGeocodingManager()
    private var geocodingDelegate : ReverseGeocodingDelegate?
    
    
    // MARK: Networking Methods
    
    func getReverseGeocodingIfoFromSpecificServer(location : CLLocationCoordinate2D, providerType : ServiceProviderType , success : (location : LocationInfoObject)->(), failure : ()->()) {
        
        self.requestReverseGeocodingInfo(self.composeUrlString(providerType, location: location), successBlock: { (json) in
            let locationObject = LocationInfoObject(json: json, providerType: providerType)
            success(location: locationObject)
        }) {
           failure()
        }
        
    }
    
    // Now Implemented With Blocks
    // If needed to implement with Delegate -  
    // should call delegate methods depending on networking and casting results
    // self.geocodingDelegate?.didRecievedLocationObject(locationObject :LocationInfoObject)
    //self.geocodingDelegate?.didFailedToFetchLocationObject()
    private func requestReverseGeocodingInfo (urlString : NSURL , successBlock : (json : JSON)->(), failureBlock : ()->()) {
        
        Alamofire.request(.GET, urlString)
            .validate()
            .response { (request, response, data, error) in
                
                if data == nil || error != nil {
                    failureBlock()
                    return
                }else {                    
                    let jsonObject = JSON(data: data!)
                    successBlock(json: jsonObject)
                }
                
            }
        
    }
    
    private func composeUrlString (providerType : ServiceProviderType, location : CLLocationCoordinate2D) -> NSURL {
        
        // Can be used ternary operator if only two choises
        let url : NSURL?
        switch providerType {
        case .NominatimProvider:
            url = NSURL(string: NSString(format: Constants.serviceNominatimFormatString, location.latitude,location.longitude) as String)
        case .GoogleProvider:
           url = NSURL(string: NSString(format: Constants.serviceGoogleFormatString, location.latitude,location.longitude) as String)
            print(url?.absoluteString)
        }
        return url!
        
    }
    
    
    // MARK: Methods To Work With Delegate
    
    func setDelegate(delegate : ReverseGeocodingDelegate) {
        
        self.geocodingDelegate = delegate
        
    }
    
    func clearDelegate() {
        
        self.geocodingDelegate = nil
        
    }
    
}