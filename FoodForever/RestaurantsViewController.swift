//
//  RestaurantsViewController.swift
//  FoodForever
//
//  Created by Jacob Ortiz on 11/12/20.
//  Copyright © 2020 jacobortiz. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search_bar: UISearchBar!
    
    var restaurant_array: [Restaurant] = []
    var filtered_table_data: [Restaurant]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        search_bar.delegate = self
        search_bar.sizeToFit()
        getAPIData()
        filtered_table_data = restaurant_array
    }
    
    func getAPIData() {
        API.getRestaurants{(restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            print(restaurants)
            print(restaurants.count)
            self.restaurant_array = restaurants
            self.filtered_table_data = self.restaurant_array
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered_table_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // restaurant cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        let restaurant = filtered_table_data[indexPath.row]
        cell.r = restaurant
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let index_path = tableView.indexPath(for: cell) {
            let r = filtered_table_data[index_path.row]
            let detail_view_controller = segue.destination as! RestaurantDetailViewController
            detail_view_controller.r = r
        }
    }
    
    // search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // when there is no text, filtereData is the same as original data
        filtered_table_data = []
        
        if searchText == "" {
            filtered_table_data = restaurant_array
        } else {
            for restaurant in restaurant_array {
                if restaurant.name.lowercased().contains(searchText.lowercased()) {
                    filtered_table_data.append(restaurant)
                }
                
            }
            self.tableView.reloadData()
        }
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
