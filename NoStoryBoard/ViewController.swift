//
//  ViewController.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/17/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let data = ["donkey","horse","queen","pawnsacrifice","jazz"]
    var Manager:NetWorkManger!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.Manager = NetWorkManger()
        self.view.backgroundColor = UIColor.white;
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

