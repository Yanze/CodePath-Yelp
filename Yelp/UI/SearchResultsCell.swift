//
//  SearchResultsCell.swift
//  Yelp
//
//  Created by yanze on 4/7/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit
import AFNetworking

class SearchResultCell: UITableViewCell {
    
    
    @IBOutlet weak var restauImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    

    var result: Business? {
        didSet {
            restauImgView.layer.cornerRadius = 10
            restauImgView.layer.masksToBounds = true
            if let imgLink = result?.image_url {
                restauImgView.setImageWith(URL(string:imgLink)!)
            }
        }
    }
    
    
}
