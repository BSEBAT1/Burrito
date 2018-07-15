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

class LocationManagerProcess: NSObject, CLLocationManagerDelegate {

    private var locationManager: CLLocationManager = CLLocationManager()

    weak var delegate: LocationServices?

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

        case .restricted, .denied:
            // Disable location features
            self.locationManager.stopUpdatingLocation()

            delegate?.errorEncountered(errorType: "Please Enable Locations")

        case .authorizedWhenInUse, .authorizedAlways:
            // Enable location features
            self.locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {

        case .restricted, .denied:
            // Disable your app's location features
            self.locationManager.stopUpdatingLocation()

            delegate?.errorEncountered(errorType: "Please Enable Locations")

        case .authorizedWhenInUse, .authorizedAlways:

            self.locationManager.startUpdatingLocation()

        case .notDetermined:

            self.locationManager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let userLocation: CLLocation = locations[0] as CLLocation

        print(userLocation.coordinate.latitude, userLocation.coordinate.longitude)

        delegate?.newLocation(lat: userLocation.coordinate.latitude, long: userLocation.coordinate.longitude)

        self.locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {

        delegate?.errorEncountered(errorType: error.localizedDescription)
    }
}
