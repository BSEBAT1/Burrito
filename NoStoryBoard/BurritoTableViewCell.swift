//
//  BurritoTableViewCell.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/20/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit

class BurritoTableViewCell: UITableViewCell {

    var name: UILabel = UILabel()

    var address: UILabel = UILabel()

    var price1: UIImageView = UIImageView()

    var price2: UIImageView = UIImageView()

    var price3: UIImageView = UIImageView()

    var price4: UIImageView = UIImageView()

    var chevron: UIImageView = UIImageView()

    var latitude: Double = Double()

    var longitude: Double = Double()

    var priceLevel: Int = Int()

    func setup(selected: Restaurants) {

        name.text = selected.name

        address.text = selected.address

        latitude = selected.latitude

        longitude = selected.longitude

        name.translatesAutoresizingMaskIntoConstraints=false

        address.translatesAutoresizingMaskIntoConstraints=false

        let array: [UIImageView] = [price1, price2, price3, price4]

        // MARK: all add subviews using array
        for views in array {

            views.translatesAutoresizingMaskIntoConstraints = false

            let image = UIImage.init(named: "cash")

            views.image = image

            views.contentMode = UIViewContentMode.scaleAspectFit

            views.clipsToBounds = true

            self.addSubview(views)

        }

        if selected.priceLevel==0 {

            price1.isHidden=true

            price2.isHidden=true

            price3.isHidden=true

            price4.isHidden=true
        } else if selected.priceLevel==1 {

            price2.isHidden=true

            price3.isHidden=true

            price4.isHidden=true
        } else if selected.priceLevel==2 {

            price3.isHidden=true

            price4.isHidden=true
        } else if selected.priceLevel==3 {

            price4.isHidden=true
        }

        name.font = UIFont(name: "Futura-Medium", size: 20)

        name.textColor = UIColor.purple

        name.textAlignment = .center

        chevron.image = UIImage(named: "chevron")

        chevron.contentMode = UIViewContentMode.scaleAspectFit

        chevron.clipsToBounds = true

        chevron.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(chevron)

        self.addSubview(name)

        self.addSubview(address)

        self.backgroundColor = UIColor.white

        self.layer.borderWidth = 0

        self.layer.cornerRadius = 20

        self.clipsToBounds = true

        // swiftlint:disable:next line_length
        let views: [String: AnyObject] = ["name": name, "Address": address, "price1": price1, "price2": price2, "price3": price3, "price4": price3, "chevron": chevron]
        // swiftlint:disable:next line_length
        let vertical = NSLayoutConstraint.constraints(withVisualFormat: "H:|-25-[name]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        // swiftlint:disable:next line_length
        let horizantal = NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[name]-10-[Address]", options: .alignAllLeading, metrics: nil, views: views)
        // swiftlint:disable:next line_length
        let imageConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[price1(15@1000)]-25-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        // swiftlint:disable:next line_length
        let imageConstraints2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-25-[price1(15@1000)]-[price2(15@1000)]-[price3(15@1000)]-[price4(15@1000)]", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views)
        // swiftlint:disable:next line_length
        let chevronConstraits = NSLayoutConstraint.constraints(withVisualFormat: "H:[chevron(20@1000)]-2-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views)
        // swiftlint:disable:next line_length
          let chevronConstraits2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[chevron(20@1000)]", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views)

        self.addConstraints(chevronConstraits)

        self.addConstraints(chevronConstraits2)

        self.addConstraints(vertical)

        self.addConstraints(horizantal)

        self.addConstraints(imageConstraints2)

        self.addConstraints(imageConstraints)
    }

    override func prepareForReuse() {

        let array: [UIImageView] = [price1, price2, price3, price4]

        for views in array {

            views.isHidden = false

        }

    }
}
