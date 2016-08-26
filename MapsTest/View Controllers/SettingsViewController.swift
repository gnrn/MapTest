//
//  SettingsViewController.swift
//  MapsTest
//
//  Created by Nikita Gorely on 8/26/16.
//  Copyright © 2016 Nikita Gorely. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var mapProviderSegment: UISegmentedControl!
    @IBOutlet weak var serviceProviderSegment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        prepareUI()
        
    }
    
    
    // MARK: @IBActions
    
    @IBAction func mapProviderValueChanged(sender: UISegmentedControl) {
      
        UserDefaultsManager.sharedInstance.setMapProviderType(MapProviderType(rawValue: sender.selectedSegmentIndex)!)
        
    }
    
    @IBAction func serviceProviderValueChanged(sender: UISegmentedControl) {
        
        UserDefaultsManager.sharedInstance.setServiceProviderType(ServiceProviderType(rawValue: sender.selectedSegmentIndex)!)
        
    }


    // MARK: Private Methods
    
    private func prepareUI() {
        
        mapProviderSegment.selectedSegmentIndex = UserDefaultsManager.sharedInstance.getMapProviderType().rawValue
        serviceProviderSegment.selectedSegmentIndex = UserDefaultsManager.sharedInstance.getServiceProviderType().rawValue
        self.navigationItem.title = Constants.settingsControllerTitle
        
    }
    
}