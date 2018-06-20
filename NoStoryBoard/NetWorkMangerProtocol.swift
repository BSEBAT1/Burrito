//
//  NetWorkMangerProtocol.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/20/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import Foundation
protocol NetWorkManagerProtocol:AnyObject {
    func NewLocations(Locations:NSMutableArray)
    func DisplayError(ErrorType:String)
    
}