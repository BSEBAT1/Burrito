//
//  ViewController.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/17/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    let table: UITableView = UITableView()

    let manager: NetWorkManger = NetWorkManger()

    let dataSource: TableViewDataSource = TableViewDataSource()

    override func viewDidLoad() {

        super.viewDidLoad()

        self.title = "Burrito Places"

        manager.delegate = dataSource

        dataSource.delegate = self

        self.view.backgroundColor = UIColor.white

        table.translatesAutoresizingMaskIntoConstraints=false

        table.dataSource = dataSource

        table.delegate = self

        self.view.addSubview(table)

        let views: [String: AnyObject] = ["table": table]

        table.rowHeight=150

        table.register(BurritoTableViewCell.self, forCellReuseIdentifier: "cell")

        table.layer.cornerRadius = 10

        table.layer.masksToBounds = true

    table.backgroundColor =  UIColor(red: 0.95, green: 0.95, blue: 0.94, alpha: 1.0)

        // swiftlint:disable:next line_length
        let veritcal = NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[table]-0-|", options: NSLayoutFormatOptions(rawValue: NSLayoutFormatOptions.RawValue(0)), metrics: nil, views: views)
        // swiftlint:disable:next line_length
        let horizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[table]-0-|", options: NSLayoutFormatOptions(rawValue: NSLayoutFormatOptions.RawValue(0)), metrics: nil, views: views)

        self.view.addConstraints(veritcal)

        self.view.addConstraints(horizontal)

    }

}

extension ViewController: UITableViewDelegate {

    // MARK: - Table View delegate methods

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.restaurantList.count
    }

    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }

    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let restaurant: Restaurants? = dataSource.restaurantList[indexPath.section] as? Restaurants
        if let selected = restaurant {
            let mapViewd: MapViewController = MapViewController(selectedRestaurantOut: selected)
            self.navigationController?.pushViewController(mapViewd, animated: false)
        }

    }
}

//Mark DataSource Protocol
extension ViewController: DataSourceProtocol {

    func updateTableView() {
        DispatchQueue.main.async {

            self.table.reloadData()
        }
    }

    func errorRetrievingData(errorDisplay: String) {

        let alertController = UIAlertController(title: "Error", message: errorDisplay, preferredStyle: .alert)

        let alertAction = UIAlertAction( title: "OK" ,
                                         style: .destructive) { action in
                                            print("action triggered \(String(describing: action.title)))")
        }

        alertController.addAction(alertAction)
        self.present(alertController, animated: false, completion: nil)
    }

}
