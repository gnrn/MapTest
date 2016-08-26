//
//  AllertManager.swift
//  MapsTest
//
//  Created by Nikita Gorely on 8/27/16.
//  Copyright © 2016 Nikita Gorely. All rights reserved.
//

import UIKit

class AllertManager: NSObject {
    
    class func allertWithTitleOnRootController(title: String, message : String, handler: ( action: UIAlertAction)->()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Cancel, handler: handler)
        alert.addAction(action)
        let vc = UIApplication.sharedApplication().keyWindow?.rootViewController
        vc?.presentViewController(alert, animated: true, completion: nil)
        
    }
    
}
