//
//  BurritoTableViewCell.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/20/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit

class BurritoTableViewCell: UITableViewCell {
    var Name:UILabel=UILabel()
    var Address:UILabel=UILabel()
    let Price1:UIImageView=UIImageView()
    let Price2:UIImageView=UIImageView()
    let Price3:UIImageView=UIImageView()
    let Price4:UIImageView=UIImageView()
    let Chevron:UIImageView=UIImageView()
    
    var latitude:Double!
    var longitude:Double!
    var PriceLevel:Int!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        
        Name.translatesAutoresizingMaskIntoConstraints=false
        Address.translatesAutoresizingMaskIntoConstraints=false
        Price1.translatesAutoresizingMaskIntoConstraints=false
        Price2.translatesAutoresizingMaskIntoConstraints=false
        Price3.translatesAutoresizingMaskIntoConstraints=false
        Price4.translatesAutoresizingMaskIntoConstraints=false
        Name.font = UIFont(name: "Futura-Medium", size:20)
        let image = UIImage.init(named:"cash")
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
        Name.textColor = UIColor.purple
        Name.textAlignment = .center
        Chevron.image=UIImage(named:"chevron")
        Chevron.contentMode=UIViewContentMode.scaleAspectFit
        Chevron.clipsToBounds=true
        Chevron.translatesAutoresizingMaskIntoConstraints=false
        self.addSubview(Chevron)
        self.addSubview(Name)
        self.addSubview(Address)
        self.addSubview(Price1)
        self.addSubview(Price2)
        self.addSubview(Price3)
        self.addSubview(Price4)
        let views:[String:AnyObject] = ["name":Name,"Address":Address,"price1":Price1,"price2":Price2,"price3":Price3,"price4":Price4,"chevron":Chevron]
        let vertical = NSLayoutConstraint.constraints(withVisualFormat:"H:|-25-[name]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        let horizantal = NSLayoutConstraint.constraints(withVisualFormat:"V:|-2-[name]-10-[Address]" , options:.alignAllLeading, metrics:nil, views:views)
        let imageConstraints = NSLayoutConstraint.constraints(withVisualFormat:"V:[price1(15@1000)]-25-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        let imageConstraints2 = NSLayoutConstraint.constraints(withVisualFormat:"H:|-25-[price1(15@1000)]-[price2(15@1000)]-[price3(15@1000)]-[price4(15@1000)]" , options:NSLayoutFormatOptions.alignAllCenterY, metrics:nil, views:views)
        let chevronConstraits = NSLayoutConstraint.constraints(withVisualFormat:"H:[chevron(20@1000)]-2-|" , options:NSLayoutFormatOptions.alignAllCenterY, metrics:nil, views:views)
          let chevronConstraits2 = NSLayoutConstraint.constraints(withVisualFormat:"V:|-50-[chevron(20@1000)]" , options:NSLayoutFormatOptions.alignAllCenterY, metrics:nil, views:views)
        
        self.addConstraints(chevronConstraits)
        self.addConstraints(chevronConstraits2)
        self.addConstraints(vertical)
        self.addConstraints(horizantal)
        self.addConstraints(imageConstraints2)
        self.addConstraints(imageConstraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
