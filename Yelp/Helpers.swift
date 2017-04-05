//
//  Helpers.swift
//  Yelp
//
//  Created by yanze on 4/4/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit
import Foundation

class Helpers: NSObject {
    
    static let sharedInstance = Helpers()
    var businesses = [Business]()
    
    
    func getBusiness() {
        YelpClient.sharedInstance.searchBusinessWith(nil, sort: nil, categories: nil, deals: nil) {
            data in
            
            for business in data {
                let newBusiness = Business()
                newBusiness.name = business["name"] as! String
                newBusiness.rating = business["rating"] as! Float
                //  TODO: found nil when unwrap the address
//                newBusiness.address = business["display_address"] as! [String]
                newBusiness.distance = business["distance"] as! Double
                newBusiness.price = business["price"] as! String
                newBusiness.image_url = business["image_url"] as! String
                newBusiness.coordinates = business["coordinates"] as! Dictionary<String, Double>
                
                newBusiness.categories = business["categories"] as! [Dictionary<String, Any>]
                newBusiness.display_phone = business["display_phone"] as! String
                newBusiness.review_count = business["review_count"] as! Int
                newBusiness.id = business["id"] as! String
                newBusiness.is_closed = business["is_closed"] as! Bool
                print(newBusiness)
            }
            
        }
    }
    
    
}
