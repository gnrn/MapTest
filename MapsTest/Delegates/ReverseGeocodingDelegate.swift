//
//  ReverseGeocodingDelegate.swift
//  MapsTest
//
//  Created by Nikita Gorely on 8/26/16.
//  Copyright © 2016 Nikita Gorely. All rights reserved.
//

import Foundation

protocol ReverseGeocodingDelegate {
    
    func didRecievedLocationObject(locationObject : LocationInfoObject)
    func didFailedToFetchLocationObject()
    
}