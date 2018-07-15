//
//  TableViewDataSource.swift
//  NoStoryBoard
//
//  Created by macbook pro on 7/15/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource, NetWorkManagerProtocol {

    var restaurantList: NSMutableArray = NSMutableArray()

    weak var delegate: DataSourceProtocol?

    override init() {

        // swiftlint:disable:next line_length
        let loadingBurrito: Restaurants = Restaurants(latitude: 0, longitude: 0, priceLevel: 0, name: "Loading", address: "Loading Restaurants")
        restaurantList.add(loadingBurrito)

    }

    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BurritoTableViewCell
        if let burrito = cell {

            let restaurants: Restaurants? = restaurantList.object(at: indexPath.section) as? Restaurants

            if let restaurant = restaurants {

                burrito.setup(selected: restaurant)

                return burrito
            }

        }
        //return blank cell in case we cannot assemble a burrito cell 
        let blank: UITableViewCell = UITableViewCell()

        return blank

    }
    // MARK: Networking Delegate Functions
    func newLocations(locations: NSMutableArray) {

        self.restaurantList = locations

        delegate?.updateTableView()
    }

    func displayError(errorType: String) {

        delegate?.errorRetrievingData(errorDisplay: errorType)

    }

}
