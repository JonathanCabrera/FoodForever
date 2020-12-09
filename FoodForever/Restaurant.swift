//
//  Restaurant.swift
//  FoodForever
//
//  Created by Jacob Ortiz on 11/12/20.
//  Copyright © 2020 jacobortiz. All rights reserved.
//

import Foundation

class Restaurant {
    var image_url: URL?
    var url: URL?
    var name: String
    var main_category: String
    var phone: String
    var reviews: Int
    
    init(dict: [String:Any]) {
        image_url = URL(string: dict["image_url"] as! String)
        name = dict["name"] as! String
        reviews = dict["review_count"] as! Int
        phone = dict["display_phone"] as! String
        url = URL(string: dict["url"] as! String)
        main_category = Restaurant.getMainCategory(dict: dict)
    }
    
    static func getMainCategory(dict: [String:Any]) -> String {
        let categories = dict["categories"] as! [[String: Any]]
        return categories[0]["title"] as! String
    }
}
