//
//  BusinessCell.swift
//  Yelp
//
//  Created by yanze on 4/4/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit
import AFNetworking

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
            populateData()
        }
    }
    
    func setupBusinessImgView() {
        businessImageView.layer.cornerRadius = 8
        businessImageView.layer.masksToBounds = true
    }
    
    func populateData() {
        if let name = business?.name {
            nameLabel.text = name
        }
        if let address = business?.address {
            let add = address.joined(separator: ", ")
            addressLabel.text = add
        }
        if let categories = business?.categories {
            var cate = [String]()
            for category in categories {
                cate.append(category["title"] as! String)
            }
            categoryLabel.text = cate.joined(separator: ", ")
        }
        if let price = business?.price {
            priceLabel.text = price
        }
        let distance = business?.distance
        if distance != nil {
            let milesPerMeter = 0.000621371
            distanceLabel.text = String(format: "%.2f mi", milesPerMeter * distance!)
        }
        if let reviewCount = business?.review_count {
            reviewLabel.text =  String(reviewCount) + " Reviews"
        }
        if let resImageUrl = business?.image_url {
            businessImageView.setImageWith(URL(string:resImageUrl)!)
        }
    }
    
    
}