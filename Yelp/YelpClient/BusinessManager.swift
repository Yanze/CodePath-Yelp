//
//  BusinessManager.swift
//  Yelp
//
//  Created by yanze on 4/4/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit
import Foundation

class BusinessManager: NSObject {
    
    static let sharedInstance = BusinessManager()
    var businesses = [Business]()
    var searchedResults = [Business]()
    
    func searchBusiness(_ term: String?, sort: String?, categories: [String]?, openNow:Bool?, completionHandler: @escaping([Business]) -> Void) {
        YelpClient.sharedInstance.searchBusinessWith(term, sort: sort, categories: categories, openNow: openNow) {
            data in
            
            self.businesses = []
            
            for business in data {
                let newBusiness = Business()
                if let name =  business["name"] as? String {
                    newBusiness.name = name
                }
                if let rating = business["rating"] as? Float {
                    newBusiness.rating = rating
                }
                if let location = business["location"] as? [String: Any] {
                    if let address = location["display_address"] as? [String] {
                        newBusiness.address = address
                    }
                }
                if let distance = business["distance"] as? Double {
                    newBusiness.distance = distance
                }
                if let price = business["price"] as? String {
                    newBusiness.price = price
                }
                if let img_url = business["image_url"] as? String {
                    newBusiness.image_url = img_url
                }
                if let coordinates = business["coordinates"] as? Dictionary<String, Double> {
                    newBusiness.coordinates = coordinates
                }
                if let categories = business["categories"] as? [Dictionary<String, Any>] {
                    newBusiness.categories = categories
                }
                if let display_phone = business["display_phone"] as? String {
                    newBusiness.display_phone = display_phone
                }
                if let review_count = business["review_count"] as? Int {
                    newBusiness.review_count = review_count
                }
                if let id = business["id"] as? String {
                    newBusiness.id = id
                }
                if let is_closed = business["is_closed"] as? Bool {
                    newBusiness.is_closed = is_closed
                }
                self.businesses.append(newBusiness)
            }
         completionHandler(self.businesses)
        }
    }
    
    
    
    
}
