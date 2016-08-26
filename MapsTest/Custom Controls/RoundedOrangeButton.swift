//
//  RoundedOrangeButton.swift
//  MapsTest
//
//  Created by Nikita Gorely on 8/26/16.
//  Copyright © 2016 Nikita Gorely. All rights reserved.
//

import UIKit

class RoundedOrangeButton: UIButton {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.orangeColor().CGColor
        
    }
      
}
