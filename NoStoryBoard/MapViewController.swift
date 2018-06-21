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
    
    var SelectedRestaurant:Restaurants!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        // Do any additional setup after loading the view.
        
        var headtwo:PurpView = PurpView()
        headtwo.Name.text=SelectedRestaurant.Name
        headtwo.Address.text=SelectedRestaurant.Address
        if SelectedRestaurant.PriceLevel==0 {
            headtwo.Price1.isHidden=true;
            headtwo.Price2.isHidden=true;
            headtwo.Price3.isHidden=true;
            headtwo.Price4.isHidden=true;
        } else if SelectedRestaurant.PriceLevel==1 {
            headtwo.Price2.isHidden=true;
            headtwo.Price3.isHidden=true;
            headtwo.Price4.isHidden=true;
        } else if SelectedRestaurant.PriceLevel==2 {
            headtwo.Price3.isHidden=true;
            headtwo.Price4.isHidden=true;
        }  else if SelectedRestaurant.PriceLevel==3 {
            headtwo.Price4.isHidden=true;
        }
        headtwo.translatesAutoresizingMaskIntoConstraints=false
        mapView.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(headtwo)
        view.addSubview(mapView)
        let views:[String:AnyObject] = ["header":headtwo,"map":mapView]
        
        let vertical = NSLayoutConstraint.constraints(withVisualFormat:"H:|[header][map]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        let horizantal = NSLayoutConstraint.constraints(withVisualFormat:"V:|[header(50@1000)][map]" , options:.alignAllLeading, metrics:nil, views:views)
        self.view.addConstraints(horizantal)
        self.view.addConstraints(vertical)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
