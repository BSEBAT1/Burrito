//
//  PurpView.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/20/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit

class PurpView: UIView {

    let name: UILabel = UILabel()

    let address: UILabel = UILabel()

    let price1: UIImageView = UIImageView()

    let price2: UIImageView = UIImageView()

    let price3: UIImageView = UIImageView()

    let price4: UIImageView = UIImageView()

    init(selection: Restaurants) {

        super.init(frame: UIScreen.main.bounds)

        self.backgroundColor=UIColor.purple

        name.translatesAutoresizingMaskIntoConstraints=false

        address.translatesAutoresizingMaskIntoConstraints=false

        let array: [UIImageView] = [price1, price2, price3, price4]

        // MARK: add subviews using array
        for views in array {

            views.translatesAutoresizingMaskIntoConstraints = false

            let image = UIImage.init(named: "cash2")

            views.image = image

            views.contentMode = UIViewContentMode.scaleAspectFit

            views.clipsToBounds = true

            self.addSubview(views)

        }

        if selection.priceLevel==0 {

            price1.isHidden = true

            price2.isHidden = true

            price3.isHidden = true

            price4.isHidden = true
        } else if selection.priceLevel==1 {

            price1.isHidden = true

            price2.isHidden = true

            price3.isHidden = true

            price4.isHidden = false
        } else if selection.priceLevel==2 {

            price1.isHidden = true

            price2.isHidden = true

        } else if selection.priceLevel==3 {

            price1.isHidden = true

            price2.isHidden = true

            price3.isHidden = true
        }

        name.font = UIFont(name: "Futura-Medium", size: 20)

        address.font = UIFont(name: "Futura-Medium", size: 17)

        address.textColor=UIColor.white

        address.adjustsFontSizeToFitWidth=true

        address.numberOfLines=1

        address.textAlignment = .center

        name.textColor = UIColor.white

        name.textAlignment = .center

        self.addSubview(name)

        self.addSubview(address)

         // swiftlint:disable:next line_length
        let views: [String: AnyObject] = ["name": name, "Address": address, "price1": price1, "price2": price2, "price3": price4, "price4": price4]
        // swiftlint:disable:next line_length
        let vertical = NSLayoutConstraint.constraints(withVisualFormat: "H:|-2-[Address]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        // swiftlint:disable:next line_length
        let horizantal = NSLayoutConstraint.constraints(withVisualFormat: "V:|-35-[Address(25@1000)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        // swiftlint:disable:next line_length
        let imageConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[price1(35@1000)]-5-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        // swiftlint:disable:next line_length
        let imageConstraints2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-4-[price1(25@1000)]-[price2(25@1000)]-[price3(25@1000)]-[price4(25@1000)]-[name]", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views)

        self.addConstraints(vertical)

        self.addConstraints(horizantal)

        self.addConstraints(imageConstraints2)

        self.addConstraints(imageConstraints)

            return
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
