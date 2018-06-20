//
//  NetWorkManger.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/18/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit
import SwiftyJSON

class NetWorkManger: NSObject,LocationServices {
    
     var LocationManager:LocationManagerProcess!
    
    override init() {
        super.init()
        self.LocationManager = LocationManagerProcess()
        LocationManager.Delegate=self;
    }
    
    
    func NewLocation(lat: Double, long: Double) {
        
        GooglePlacesOperation(lat: lat, long: long)
    }
    
    func ErrorEncountered(ErrorType: String) {
        
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
            
                guard let dataDictionary:[String : Any] = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                    
                    else{
                    self.ReportError(Error:"Error Parsing JSON")
                    return
                }
                
            
            }
            catch let JsonError {
                self.ReportError(Error: JsonError.localizedDescription)
                
            }
            
            
        }.resume()
        
        
        
    }
    
    func ReportError(Error:String){
        
    }
    
}
