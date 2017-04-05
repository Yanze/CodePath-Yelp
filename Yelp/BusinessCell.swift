//
//  BusinessCell.swift
//  Yelp
//
//  Created by yanze on 4/4/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    
    @IBOutlet weak var businessImageView: UIImageView!
    @IBOutlet weak var rateImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var business: Business? {
        didSet {
            setupBusinessImgView()
        }
    }
    
    func setupBusinessImgView() {
        businessImageView.layer.cornerRadius = 5
        businessImageView.layer.masksToBounds = true
    }
    
    
}
