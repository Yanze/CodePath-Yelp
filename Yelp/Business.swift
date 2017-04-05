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
    var rating: Int
    var address: Dictionary<String, Any>
    var distance: Float
    var price: String
    var image_url: String
    var coordinates: Dictionary<Double, Double>
    var category: [Dictionary<String, Any>]
    var display_phone: String
    var review_count: Int
    var id: String
    var is_closed: Bool

    override init() {
        self.name = ""
        self.rating = 0
        self.address = Dictionary()
        self.distance = 0.0
        self.price = ""
        self.image_url = ""
        self.coordinates = Dictionary()
        self.category = [[:]]
        self.display_phone = ""
        self.review_count = 0
        self.id = ""
        self.is_closed = false
    }
    
//    init(name: String, rating: Int, address: Dictionary, distance: Float, price: String, image_url: String, coordinates: Dictionary, )
    

    
    
}
