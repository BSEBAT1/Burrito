//
//  DataSourceProtocol.swift
//  NoStoryBoard
//
//  Created by macbook pro on 7/15/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import Foundation

protocol DataSourceProtocol: AnyObject {

    func updateTableView()

    func errorRetrievingData(errorDisplay: String)

}
