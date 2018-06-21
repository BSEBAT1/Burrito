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
        let camera = GMSCameraPosition.camera(withLatitude:SelectedRestaurant.latitude, longitude:SelectedRestaurant.longitude, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view.backgroundColor=UIColor.white
      
        let marker = GMSMarker()
        let markerImage = UIImage(named: "Pin")!
        let markerView = UIImageView(image: markerImage)
        marker.iconView = markerView
        marker.position = CLLocationCoordinate2D(latitude:SelectedRestaurant.latitude, longitude: SelectedRestaurant.longitude)
        marker.map = mapView
        // Do any additional setup after loading the view.
        
        let headtwo:PurpView = PurpView()
        headtwo.Name.text=SelectedRestaurant.Name
        headtwo.Address.text=SelectedRestaurant.Address
        if SelectedRestaurant.PriceLevel==0 {
            headtwo.Price1.isHidden=true;
            headtwo.Price2.isHidden=true;
            headtwo.Price3.isHidden=true;
            headtwo.Price4.isHidden=true;
        } else if SelectedRestaurant.PriceLevel==1 {
            headtwo.Price1.isHidden=true;
            headtwo.Price2.isHidden=true;
            headtwo.Price3.isHidden=true;
            headtwo.Price4.isHidden=false;
        } else if SelectedRestaurant.PriceLevel==2 {
            headtwo.Price1.isHidden=true;
            headtwo.Price2.isHidden=true;
        }  else if SelectedRestaurant.PriceLevel==3 {
            headtwo.Price1.isHidden=true;
            headtwo.Price2.isHidden=true;
            headtwo.Price3.isHidden=true;
        }
        headtwo.translatesAutoresizingMaskIntoConstraints=false
        mapView.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(headtwo)
        view.addSubview(mapView)
        let views:[String:AnyObject] = ["header":headtwo,"map":mapView]
        
        let vertical = NSLayoutConstraint.constraints(withVisualFormat:"H:|-0-[header]-0-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
          let vertical2 = NSLayoutConstraint.constraints(withVisualFormat:"H:|[map]|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        let horizantal = NSLayoutConstraint.constraints(withVisualFormat:"V:|-2-[header(150@750)]-0-[map]-0-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        self.view.addConstraints(horizantal)
        self.view.addConstraints(vertical)
        self.view.addConstraints(vertical2)
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
