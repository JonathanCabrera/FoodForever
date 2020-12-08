//
//  API.swift
//  FoodForever
//
//  Created by Jacob Ortiz on 11/12/20.
//  Copyright © 2020 jacobortiz. All rights reserved.
//

import Foundation


struct API {
    
    static func getRestaurants(completion: @escaping ([Restaurant]?) -> Void) {
        
        let apikey = "2gt4_8YgYsIMogZOXEcoWYmKaYwom6UvIU6SH9mkdhX15-AcsDrKjY2FBvE9HDjdFSRRp6-suLex6PN1Ih7EQqktp4Mm_IFWwmvZUxJlqZ5WG23ZESGhf-fK8FFhX3Yx"
        
        // Coordinates for San Francisco
        let lat = 37.773972
        let long = -122.431297
        
        
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Insert API Key to request
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
                let data_dictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let total = data_dictionary["total"]
                print(total ?? 0)
                
                // Get array of restaurant dictionaries
                let rest_dictionaries = data_dictionary["businesses"] as! [[String: Any]]
                print(rest_dictionaries)
                
                // Variable to store array of Restaurants
                var restaurants: [Restaurant] = []
            
                // Use each restaurant dictionary to initialize Restaurant Object
                for dictionary in rest_dictionaries {
                    let restaurant = Restaurant.init(dict: dictionary)
                    restaurants.append(restaurant)
                }
                
                return completion(restaurants)
                
            }
        }
        
        task.resume()
        
    }
}
