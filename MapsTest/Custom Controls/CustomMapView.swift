//
//  CustomMapView.swift
//  MapsTest
//
//  Created by Nikita Gorely on 8/26/16.
//  Copyright © 2016 Nikita Gorely. All rights reserved.
//

import UIKit
import SKMaps

class CustomMapView: SKMapView {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        let mapViewStyle = SKMapViewStyle()
        mapViewStyle.resourcesFolderName = "DayStyle"
        mapViewStyle.styleFileName = "dayStyle.json"
        SKMapView.setMapStyle(mapViewStyle)
        self.hideCallout()
        self.mapScaleView.hidden = true
        
    }
    
}
