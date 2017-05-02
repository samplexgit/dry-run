//
//  SingletonClass.swift
//  Location
//
//  Created by Shilp_m on 1/30/17.
//  Copyright © 2017 Shilp_mphoton pho. All rights reserved.
//

import UIKit
import CoreLocation

protocol locationDelegate {
    func locationData(locationdata: CLLocation)
}

class SingletonClass: NSObject, CLLocationManagerDelegate {
    
    static let SharedInstance = SingletonClass()
    var locationdelegate: locationDelegate?
    var locationManager:CLLocationManager?
    var lastLocation: CLLocation?
    var region:CLRegion?
    
    
   override init() {
    super.init()
    self.locationManager = CLLocationManager()
    if CLLocationManager.authorizationStatus() == .notDetermined {
        locationManager?.requestAlwaysAuthorization()
    }
    locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    locationManager?.distanceFilter = 200
    locationManager?.delegate = self
    
    }
    
    func startUpdatingLocation() {
        self.locationManager?.startUpdatingLocation()
        
    }
    
    func stopUpdatingLocation() {
        self.locationManager?.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location = locations.last
        //print(location)
        //print(location?.altitude)
        //print(location?.coordinate)
        //print(location?.coordinate.latitude)
        let k = kvc()
        k.setValue(String(format: "%f", (location?.coordinate.latitude)!), forKey: "name")
        //let string = k.value(forKey: "name") as! String
        //print(string)
        
        
         self.lastLocation = location
        locationdelegate?.locationData(locationdata: self.lastLocation!)
        
        //self.setValue(String(format: "%f", (location?.coordinate.latitude)!), forKey: "lat")
        //self.setValue(String(format: "%f", (location?.coordinate.longitude)!), forKey: "long")
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        // do on error
        //updateLocationDidFailWithError(error: error as NSError)
    }
    
    

}
