//
//  LocationServicesProtocol.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/18/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import Foundation

protocol LocationServices: AnyObject {

    func newLocation(lat: Double, long: Double)

    func errorEncountered(errorType: String)
}
