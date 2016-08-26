//
//  Constants.swift
//  MapsTest
//
//  Created by Nikita Gorely on 8/26/16.
//  Copyright © 2016 Nikita Gorely. All rights reserved.
//

import Foundation

struct Constants {
    
    // NSUserDefaults Constants
    static let mapProviderKey = "mapProviderKey"
    static let serviceProviderKey = "serviceProviderKey"
    
    // Controller Titles Constants
    static let mapControllerTitle = "Map Service"
    static let settingsControllerTitle = "App Settings"
    
    // Query Strings Constants
    static let serviceNominatimFormatString = "http://nominatim.openstreetmap.org/reverse?format=json&lat=%f&lon=%f&addressdetails=1&accept-language=en"    
    static let serviceGoogleFormatString = "https://maps.googleapis.com/maps/api/geocode/json?latlng=%f,%f&key=AIzaSyAmhz1loX1AgpeKHg7j7vjgHvCAMt7B6lk&language=en"
    
    // Allert Titles
    static let okAllertTitle = "mapProviderKey"
    static let cantLoadMessage = "Sorry:(\nUnable to load point info!"
    
    
}