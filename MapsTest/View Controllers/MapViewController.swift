//
//  MapViewController.swift
//  MapsTest
//
//  Created by Nikita Gorely on 8/26/16.
//  Copyright © 2016 Nikita Gorely. All rights reserved.
//

import UIKit
import SKMaps
import MapKit

class MapViewController: UIViewController {
    
    private var mapProviderType : MapProviderType?
    private var serviceProviderType : ServiceProviderType?
    
    @IBOutlet weak var nativeMapView: MKMapView!
    @IBOutlet weak var nonNativeMapView: CustomMapView!

    @IBOutlet weak var pointInfoDisplayView: RoundedOrangeBorderedView!
    @IBOutlet weak var pointInfoLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = Constants.mapControllerTitle
        nonNativeMapView.delegate = self
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MapViewController.handleTap(_:)))
        nativeMapView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        self.mapProviderType = UserDefaultsManager.sharedInstance.getMapProviderType()
        self.serviceProviderType = UserDefaultsManager.sharedInstance.getServiceProviderType()
        
        mapProviderType == MapProviderType.NativeMapKitProvider ? showOnlyCustomMap(false) : showOnlyCustomMap(true)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.hidePointInfoPannel()
        
    }
    
    func handleTap(gestureReconizer: UITapGestureRecognizer) {
        
        let location = gestureReconizer.locationInView(nativeMapView)
        let coordinate = nativeMapView.convertPoint(location,toCoordinateFromView: nativeMapView)
        self.updatePlacaInfoWithCoordinatesByRequest(coordinate)
        
    }
    
    
    // MARK: Private Methods
    
    private func updatePlacaInfoWithCoordinatesByRequest( coordinates : CLLocationCoordinate2D) {
        
        weak var weakself = self
        ReverseGeocodingManager.sharedInstance.getReverseGeocodingIfoFromSpecificServer(coordinates, providerType: self.serviceProviderType!, success: { (location) in
            weakself?.showPointInfoPannelWithText(location.fullDescription!)
        }) {
            weakself?.hidePointInfoPannel()
            AllertManager.allertWithTitleOnRootController(Constants.okAllertTitle, message: Constants.cantLoadMessage, handler: { (action) in })
        }
        
    }
    
    private func showOnlyCustomMap (isCustomMap : Bool) {
        
        if isCustomMap {
            nonNativeMapView.hidden = false
            nativeMapView.hidden = true
        }else {
            nonNativeMapView.hidden = true
            nativeMapView.hidden = false
        }
        
    }
    
    private func showPointInfoPannelWithText(text : String) {
        
        self.pointInfoLabel.text = text
        self.pointInfoDisplayView.hidden = false
        
    }
    
    private func hidePointInfoPannel() {
        
        self.pointInfoDisplayView.hidden = true
        
    }

    
    // MARK: @IBActions
    
    @IBAction func pointInfoViewCloseAction(sender: UIButton) {
        
        self.hidePointInfoPannel()
        
    }
    
}


extension MapViewController : SKMapViewDelegate {
    
    func mapView(mapView: SKMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        
        self.updatePlacaInfoWithCoordinatesByRequest(coordinate)
        
    }
    
}


extension MapViewController : ReverseGeocodingDelegate {
    
    func didRecievedLocationObject(locationObject: LocationInfoObject) {
        
        self.showPointInfoPannelWithText(locationObject.fullDescription!)

    }
    
    func didFailedToFetchLocationObject() {
        
        self.hidePointInfoPannel()
        AllertManager.allertWithTitleOnRootController(Constants.okAllertTitle, message: Constants.cantLoadMessage, handler: { (action) in })
        
    }
    
}
