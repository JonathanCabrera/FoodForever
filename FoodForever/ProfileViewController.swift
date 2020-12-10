//
//  ProfileViewController.swift
//  FoodForever
//
//  Created by Jonathan Cabrera on 12/8/20.
//  Copyright © 2020 jacobortiz. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var username_label: UILabel!
    @IBOutlet weak var biography_label: UILabel!
    @IBOutlet weak var image_label: UIImageView!
    
    var restaurant_array: [Restaurant] = []
    var filtered_table_data: [Restaurant]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        getAPIData()
        getProfileValues()
        filtered_table_data = restaurant_array
    }
    
    func getProfileValues() {
        print("workingProfileValue")
        var currentUser = PFUser.current()
    }
    
    func getAPIData() {
        API.getRestaurants{(restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            //print(restaurants)
            //print(restaurants.count)
            self.restaurant_array = restaurants
            self.filtered_table_data = self.restaurant_array
            self.tableview.reloadData()
        }
    }
    
    func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered_table_data.count
    }
    
    func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // restaurant cell
        let cell = tableview.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        let restaurant = filtered_table_data[indexPath.row]
        cell.r = restaurant
        
        return cell
    }
}
