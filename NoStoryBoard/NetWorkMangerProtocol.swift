//
//  NetWorkMangerProtocol.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/20/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import Foundation

protocol NetWorkManagerProtocol: AnyObject {

    func newLocations(locations: NSMutableArray)

    func displayError(errorType: String)
}
