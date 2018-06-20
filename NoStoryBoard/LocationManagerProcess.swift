//
//  LocationManager.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/17/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class LocationManagerProcess: NSObject,CLLocationManagerDelegate{
   
     var locationManager: CLLocationManager = CLLocationManager()
    weak var Delegate:LocationServices?
    
    override init() {
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.allowsBackgroundLocationUpdates=true
        self.locationManager.distanceFilter=50
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                
                // Request when-in-use authorization initially
               self.locationManager.requestWhenInUseAuthorization()
                break
                
            case .restricted, .denied:
                // Disable location features
               self.locationManager.stopUpdatingLocation()
                break
                
            case .authorizedWhenInUse, .authorizedAlways:
                // Enable location features
                self.locationManager.startUpdatingLocation()
                
                break
            }
        }
    
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
    case .restricted, .denied:
        // Disable your app's location features
        self.locationManager.stopUpdatingLocation()
        break
        
    case .authorizedWhenInUse, .authorizedAlways:
       
       self.locationManager.startUpdatingLocation()
       
        break
        
    case .notDetermined:
       self.locationManager.requestWhenInUseAuthorization()
        break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0] as CLLocation
        print(userLocation.coordinate.latitude,userLocation.coordinate.longitude)
        Delegate?.NewLocation(lat:userLocation.coordinate.latitude , long: userLocation.coordinate.longitude)
        self.locationManager.stopUpdatingLocation();
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print(error)
    }
    
    deinit {
      print("we are gone")
    }
    
}




    
    

