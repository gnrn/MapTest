//
//  LocationInfoObject.swift
//  MapsTest
//
//  Created by Nikita Gorely on 8/26/16.
//  Copyright © 2016 Nikita Gorely. All rights reserved.
//

import UIKit
import SwiftyJSON

class LocationInfoObject: NSObject {

    var fullDescription : String?

    init(json : JSON , providerType : ServiceProviderType) {
        
        //Only for two providers, if more - another logical construction needed
        if providerType == .NominatimProvider {
            self.fullDescription = json["display_name"].string ?? "-----"
        }else {
            self.fullDescription = json["results"][0]["formatted_address"].string ?? "-----"
        }
        super.init()
        
    }
    
}
