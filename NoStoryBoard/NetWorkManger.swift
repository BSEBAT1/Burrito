//
//  NetWorkManger.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/18/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit


class NetWorkManger: NSObject,LocationServices {
    
     var LocationManager:LocationManagerProcess!
     weak var Delegate:NetWorkManagerProtocol?
    
    override init() {
        super.init()
        self.LocationManager = LocationManagerProcess()
        LocationManager.Delegate=self;
    }
    
    
    func NewLocation(lat: Double, long: Double) {
        URLSession.shared.invalidateAndCancel()
        GooglePlacesOperation(lat: lat, long: long)
    }
    
    func ErrorEncountered(ErrorType: String) {
        ReportError(Error: ErrorType)
    }
    
   func GooglePlacesOperation(lat:Double,long:Double){
      
        
    let Json = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(lat),\(long)&radius=1500&type=restaurant&keyword=burrito&key=AIzaSyCrEWb1Hsk1hNj_rLsUF_ML6Z-_4fy4yfo"
        
        guard let url = URL(string: Json) else {
            ReportError(Error:"Malformed URL Error")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, errors) in
            if let Errors=errors {
                self.ReportError(Error: Errors.localizedDescription)
                return
            }
              let statusCode = (response as! HTTPURLResponse).statusCode
            
            if statusCode != 200{
                self.ReportError(Error:"Error Retrieving Burrito Locations")
                return
            }
            guard let data = data else{
                self.ReportError(Error:"Invalid Data")
                return
            }
            do {
            let json = try JSON(data: data)
                var ObjectCollection:NSMutableArray = NSMutableArray()
                if let subarray = json["results"].array{
                    for obj in subarray{
                        let value = obj["price_level"].intValue
                        let lati = obj["geometry"]["location"]["lat"].doubleValue
                        let langi = obj["geometry"]["location"]["lng"].doubleValue
                        let name = obj["name"].stringValue
                        let adress = obj["vicinity"].stringValue
                        let Restaurant:Restaurants = Restaurants(latitude: lati, longitude: langi, PriceLevel: value, Name: name, Address: adress)
                        ObjectCollection.add(Restaurant)
                    }
                    self.UpdateUi(locations: ObjectCollection)
                }
                
            }
            catch let error{
                self.ReportError(Error:error.localizedDescription)
            }
            
            
        }.resume()
        
        
        
    }
    
   internal func ReportError(Error:String){
        Delegate?.DisplayError(ErrorType: Error)
    }
    
  internal func UpdateUi(locations:NSMutableArray){
        Delegate?.NewLocations(Locations: locations)
    }
    
}
