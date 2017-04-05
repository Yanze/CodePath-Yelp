//
//  Business.swift
//  Yelp
//
//  Created by yanze on 4/4/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import Foundation
import AFNetworking




class Business: NSObject {
    var name: String
    var rating: Float
    var address: [String]
    var distance: Double
    var price: String
    var image_url: String
    var coordinates: Dictionary<String, Double>
    var categories: [Dictionary<String, Any>]
    var display_phone: String
    var review_count: Int
    var id: String
    var is_closed: Bool

    override init() {
        self.name = ""
        self.rating = 0.0
        self.address = [String]()
        self.distance = 0.0
        self.price = ""
        self.image_url = ""
        self.coordinates = Dictionary()
        self.categories = [[:]]
        self.display_phone = ""
        self.review_count = 0
        self.id = ""
        self.is_closed = false
    }
    
    init(name: String, rating: Float, address: [String], distance: Double, price: String, image_url: String, coordinates: Dictionary<String, Double>, categories: [Dictionary<String, Any>], display_phone: String, review_count: Int, id: String, is_closed: Bool) {
        self.name = name
        self.rating = rating
        self.address = address
        self.distance = distance
        self.price = price
        self.image_url = image_url
        self.coordinates = coordinates
        self.categories = categories
        self.display_phone = display_phone
        self.review_count = review_count
        self.id = id
        self.is_closed = is_closed
    }
    

    
    
}
