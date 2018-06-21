//
//  PurpView.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/20/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit

class PurpView: UIView {
    
    var Name:UILabel=UILabel()
    var Address:UILabel=UILabel()
    let Price1:UIImageView=UIImageView()
    let Price2:UIImageView=UIImageView()
    let Price3:UIImageView=UIImageView()
    let Price4:UIImageView=UIImageView()
   

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.purple
        Name.translatesAutoresizingMaskIntoConstraints=false
        Address.translatesAutoresizingMaskIntoConstraints=false
        Price1.translatesAutoresizingMaskIntoConstraints=false
        Price2.translatesAutoresizingMaskIntoConstraints=false
        Price3.translatesAutoresizingMaskIntoConstraints=false
        Price4.translatesAutoresizingMaskIntoConstraints=false
        Name.font = UIFont(name: "Futura-Medium", size:20)
        Address.font = UIFont(name: "Futura-Medium", size:17)
        Address.textColor=UIColor.white
        Address.adjustsFontSizeToFitWidth=true
        Address.numberOfLines=1
        Address.textAlignment = .center
        let image = UIImage.init(named:"cash2")
        Price1.image=image
        Price1.contentMode=UIViewContentMode.scaleAspectFit
        Price1.clipsToBounds=true
        
        Price2.image=image
        Price2.contentMode=UIViewContentMode.scaleAspectFit
        Price2.clipsToBounds=true
        
        Price3.image=image
        Price3.contentMode=UIViewContentMode.scaleAspectFit
        Price3.clipsToBounds=true
        
        Price4.image=image
        Price4.contentMode=UIViewContentMode.scaleAspectFit
        Price4.clipsToBounds=true
        Name.textColor = UIColor.white
        Name.textAlignment = .center
        
        self.addSubview(Name)
        self.addSubview(Address)
        self.addSubview(Price1)
        self.addSubview(Price2)
        self.addSubview(Price3)
        self.addSubview(Price4)
        
        let views:[String:AnyObject] = ["name":Name,"Address":Address,"price1":Price1,"price2":Price2,"price3":Price3,"price4":Price4]
        let vertical = NSLayoutConstraint.constraints(withVisualFormat:"H:|-2-[Address]-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        let horizantal = NSLayoutConstraint.constraints(withVisualFormat:"V:|-35-[Address(25@1000)]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        let imageConstraints = NSLayoutConstraint.constraints(withVisualFormat:"V:[price1(35@1000)]-5-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        let imageConstraints2 = NSLayoutConstraint.constraints(withVisualFormat:"H:|-4-[price1(25@1000)]-[price2(25@1000)]-[price3(25@1000)]-[price4(25@1000)]-[name]" , options:NSLayoutFormatOptions.alignAllCenterY, metrics:nil, views:views)

        self.addConstraints(vertical)
        self.addConstraints(horizantal)
        self.addConstraints(imageConstraints2)
        self.addConstraints(imageConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
