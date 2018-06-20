//
//  RestaurantObj.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/18/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import Foundation

struct Restaurants : Codable {
    let html_attributions : [String]?
    let results : [Results]?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        
        case html_attributions = "html_attributions"
        case results = "results"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        html_attributions = try values.decodeIfPresent([String].self, forKey: .html_attributions)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
    struct Southwest : Codable {
        let lat : Double?
        let lng : Double?
        
        enum CodingKeys: String, CodingKey {
            
            case lat = "lat"
            case lng = "lng"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            lat = try values.decodeIfPresent(Double.self, forKey: .lat)
            lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        }
        
    }
    
    struct Viewport : Codable {
        let northeast : Northeast?
        let southwest : Southwest?
        
        enum CodingKeys: String, CodingKey {
            
            case northeast
            case southwest
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            northeast = try Northeast(from: decoder)
            southwest = try Southwest(from: decoder)
        }
        
        
    }
    
    struct Geometry : Codable {
        let location : Location?
        let viewport : Viewport?
        
        enum CodingKeys: String, CodingKey {
            
            case location
            case viewport
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            location = try Location(from: decoder)
            viewport = try Viewport(from: decoder)
        }
        
    }
    struct Location : Codable {
        let lat : Double?
        let lng : Double?
        
        enum CodingKeys: String, CodingKey {
            
            case lat = "lat"
            case lng = "lng"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            lat = try values.decodeIfPresent(Double.self, forKey: .lat)
            lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        }
        
    }
    struct Northeast : Codable {
        let lat : Double?
        let lng : Double?
        
        enum CodingKeys: String, CodingKey {
            
            case lat = "lat"
            case lng = "lng"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            lat = try values.decodeIfPresent(Double.self, forKey: .lat)
            lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        }
        
    }
    struct Opening_hours : Codable {
        let open_now : Bool?
        let weekday_text : [String]?
        
        enum CodingKeys: String, CodingKey {
            
            case open_now = "open_now"
            case weekday_text = "weekday_text"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            open_now = try values.decodeIfPresent(Bool.self, forKey: .open_now)
            weekday_text = try values.decodeIfPresent([String].self, forKey: .weekday_text)
        }
        
    }
    struct Photos : Codable {
        let height : Int?
        let html_attributions : [String]?
        let photo_reference : String?
        let width : Int?
        
        enum CodingKeys: String, CodingKey {
            
            case height = "height"
            case html_attributions = "html_attributions"
            case photo_reference = "photo_reference"
            case width = "width"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            height = try values.decodeIfPresent(Int.self, forKey: .height)
            html_attributions = try values.decodeIfPresent([String].self, forKey: .html_attributions)
            photo_reference = try values.decodeIfPresent(String.self, forKey: .photo_reference)
            width = try values.decodeIfPresent(Int.self, forKey: .width)
        }
        
    }
    struct Results : Codable {
        let geometry : Geometry?
        let icon : String?
        let id : String?
        let name : String?
        let opening_hours : Opening_hours?
        let photos : [Photos]?
        let place_id : String?
        let price_level : Int?
        let rating : Double?
        let reference : String?
        let scope : String?
        let types : [String]?
        let vicinity : String?
        
        enum CodingKeys: String, CodingKey {
            
            case geometry
            case icon = "icon"
            case id = "id"
            case name = "name"
            case opening_hours
            case photos = "photos"
            case place_id = "place_id"
            case price_level = "price_level"
            case rating = "rating"
            case reference = "reference"
            case scope = "scope"
            case types = "types"
            case vicinity = "vicinity"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            geometry = try Geometry(from: decoder)
            icon = try values.decodeIfPresent(String.self, forKey: .icon)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            opening_hours = try Opening_hours(from: decoder)
            photos = try values.decodeIfPresent([Photos].self, forKey: .photos)
            place_id = try values.decodeIfPresent(String.self, forKey: .place_id)
            price_level = try values.decodeIfPresent(Int.self, forKey: .price_level)
            rating = try values.decodeIfPresent(Double.self, forKey: .rating)
            reference = try values.decodeIfPresent(String.self, forKey: .reference)
            scope = try values.decodeIfPresent(String.self, forKey: .scope)
            types = try values.decodeIfPresent([String].self, forKey: .types)
            vicinity = try values.decodeIfPresent(String.self, forKey: .vicinity)
        }
        
}
    
}
struct Response:Decodable {
    var lat:Double?
    var long:Double?
    init(from decoder: Decoder) throws {
        let Restaurant = try Restaurants(from: decoder)
        
        // Now you can pick items that are important to your data model,
        // conveniently decoded into a Swift structure
       lat = Restaurant.results?.first?.geometry?.location?.lat
       long = Restaurant.results?.first?.geometry?.location?.lat
        
    }
}
