//
//  ViewController.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/17/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NetWorkManagerProtocol,UITableViewDelegate,UITableViewDataSource {
    
    var Table:UITableView!
    
    var Manager:NetWorkManger!
    var RestaurantList:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let LoadingBurrito:Restaurants = Restaurants(latitude:0, longitude:0, PriceLevel:0, Name:"Loading", Address: "Loading Restaurants")
        RestaurantList.add(LoadingBurrito)
        
        self.Manager = NetWorkManger()
        self.Manager.Delegate=self;

        self.view.backgroundColor = UIColor.white;
        Table = UITableView()
        Table.translatesAutoresizingMaskIntoConstraints=false
        Table.dataSource=self
        Table.delegate=self
        self.view.addSubview(Table)
        let views:[String:AnyObject] = ["table":Table]
        Table.rowHeight=150
        Table.register(BurritoTableViewCell.self, forCellReuseIdentifier:"cell")
        Table.layer.cornerRadius = 10
        Table.layer.masksToBounds = true
        Table.backgroundColor =  UIColor(red:0.95, green:0.95, blue:0.94, alpha:1.0)
        let veritcal = NSLayoutConstraint.constraints(withVisualFormat:"V:|-5-[table]-0-|" , options:NSLayoutFormatOptions(rawValue: NSLayoutFormatOptions.RawValue(0)), metrics:nil, views:views)
        let horizontal = NSLayoutConstraint.constraints(withVisualFormat:"H:|-0-[table]-0-|" , options:NSLayoutFormatOptions(rawValue: NSLayoutFormatOptions.RawValue(0)), metrics:nil, views:views)
        self.view.addConstraints(veritcal)
        self.view.addConstraints(horizontal)
        
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func NewLocations(Locations: NSMutableArray) {
        DispatchQueue.main.async {
            self.RestaurantList = Locations
            self.Table.reloadData()
        }
    }
    
    func DisplayError(ErrorType: String) {
        
    }
    
    // MARK: - Table View delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.RestaurantList.count
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BurritoTableViewCell
        let Restaurant:Restaurants = RestaurantList.object(at: indexPath.section) as! Restaurants
        cell.Name.text=Restaurant.Name
        cell.Address.text=Restaurant.Address
        cell.latitude=Restaurant.latitude
        cell.longitude=Restaurant.longitude
        if Restaurant.PriceLevel==0 {
            cell.Price1.isHidden=true;
            cell.Price2.isHidden=true;
            cell.Price3.isHidden=true;
            cell.Price4.isHidden=true;
        } else if Restaurant.PriceLevel==1 {
            cell.Price2.isHidden=true;
            cell.Price3.isHidden=true;
            cell.Price4.isHidden=true;
        } else if Restaurant.PriceLevel==2 {
            cell.Price3.isHidden=true;
            cell.Price4.isHidden=true;
        }  else if Restaurant.PriceLevel==3 {
            cell.Price4.isHidden=true;
        }
        
        // add border and color
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 0
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped cell number \(indexPath.section).")
        
        let Restaurant:Restaurants = RestaurantList[indexPath.section] as! Restaurants;
        
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
            UIApplication.shared.open(URL(string:"comgooglemaps://?center=\(Restaurant.latitude!)&zoom=14&views=traffic&q=\(Restaurant.latitude!),\(Restaurant.longitude)")!, options: [:], completionHandler: nil)
        } else {
            print("Can't use comgooglemaps://")
        }
    }
    }




