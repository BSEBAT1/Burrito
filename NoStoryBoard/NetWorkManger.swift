//
//  NetWorkManger.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/18/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit

class NetWorkManger: NSObject, LocationServices {

    var locationManager: LocationManagerProcess!

    weak var delegate: NetWorkManagerProtocol?

    override init() {

        super.init()

        locationManager = LocationManagerProcess()

        locationManager.delegate = self
    }

    func newLocation(lat: Double, long: Double) {

        URLSession.shared.invalidateAndCancel()

        googlePlacesOperation(lat: lat, long: long)
    }

    func errorEncountered(errorType: String) {

        reportError(error: errorType)
    }

    func googlePlacesOperation(lat: Double, long: Double) {

        // swiftlint:disable:next line_length
        let json = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(lat),\(long)&radius=1500&type=restaurant&keyword=burrito&key=AIzaSyCrEWb1Hsk1hNj_rLsUF_ML6Z-_4fy4yfo"

        guard let url = URL(string: json) else {

            reportError(error: "Malformed URL Error")

            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, errors) in

            if let errors = errors {

                self.reportError(error: errors.localizedDescription)

                return
            }

            if let httpResponse = response as? HTTPURLResponse {

                let statusCode = httpResponse.statusCode

                if statusCode != 200 {

                    self.reportError(error: "Error Retrieving Burrito Locations")

                    return
                }
                guard let data = data else {

                    self.reportError(error: "Invalid Data")

                    return
                }
                do {

                    let json = try JSON(data: data)

                    let objectCollection: NSMutableArray = NSMutableArray()

                    if let subarray = json["results"].array {

                        for obj in subarray {

                            let value = obj["price_level"].intValue

                            let lati = obj["geometry"]["location"]["lat"].doubleValue

                            let langi = obj["geometry"]["location"]["lng"].doubleValue

                            let name = obj["name"].stringValue

                            let adress = obj["vicinity"].stringValue

                            // swiftlint:disable:next line_length
                            let restaurant: Restaurants = Restaurants(latitude: lati, longitude: langi, priceLevel: value, name: name, address: adress)

                            objectCollection.add(restaurant)
                        }
                        self.updateUi(locations: objectCollection)

                    }

                } catch let error {

                    self.reportError(error: error.localizedDescription)
                }

            }

            }.resume()
    }

    internal func reportError(error: String) {

        delegate?.displayError(errorType: error)
    }

    internal func updateUi(locations: NSMutableArray) {

        delegate?.newLocations(locations: locations)
    }

}
