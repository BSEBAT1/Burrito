//
//  MapViewController.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/20/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    var selectedRestaurant: Restaurants

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(selectedRestaurantOut: Restaurants) {

        selectedRestaurant=selectedRestaurantOut

        super.init(nibName: nil, bundle: nil)

        self.title = selectedRestaurantOut.name
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        // swiftlint:disable:next line_length
        let camera = GMSCameraPosition.camera(withLatitude: selectedRestaurant.latitude, longitude: selectedRestaurant.longitude, zoom: 15.0)

        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)

        self.view.backgroundColor=UIColor.white

        let marker = GMSMarker()

        let markerImage = UIImage(named: "Pin")!

        let markerView = UIImageView(image: markerImage)

        marker.iconView = markerView

        // swiftlint:disable:next line_length
        marker.position = CLLocationCoordinate2D(latitude: selectedRestaurant.latitude, longitude: selectedRestaurant.longitude)

        marker.map = mapView

        let headtwo: PurpView = PurpView.init(selection: selectedRestaurant)

        headtwo.name.text = selectedRestaurant.name

        headtwo.address.text = selectedRestaurant.address

        headtwo.translatesAutoresizingMaskIntoConstraints=false

        mapView.translatesAutoresizingMaskIntoConstraints=false

        view.addSubview(headtwo)

        view.addSubview(mapView)

        let views: [String: AnyObject] = ["header": headtwo, "map": mapView]
        // swiftlint:disable:next line_length
        let vertical = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[header]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)

        // swiftlint:disable:next line_length
        let vertical2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|[map]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        // swiftlint:disable:next line_length
        let horizantal = NSLayoutConstraint.constraints(withVisualFormat: "V:|-89-[header(150@750)]-0-[map]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)

        self.view.addConstraints(horizantal)

        self.view.addConstraints(vertical)

        self.view.addConstraints(vertical2)
    }

}
