//
//  RestaurantsViewController.swift
//  FoodForever
//
//  Created by Jacob Ortiz on 11/12/20.
//  Copyright © 2020 jacobortiz. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search_bar: UISearchBar!
    
    var restaurant_array: [Restaurant] = []
    var filtered_table_data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        search_bar.delegate = self
        getAPIData()
    }
    
    func getAPIData() {
        API.getRestaurants { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            print(restaurants)
            self.restaurant_array = restaurants
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // restaurant cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell") as! RestaurantTableViewCell
        
        let restaurant = restaurant_array[indexPath.row]
        
        cell.r = restaurant
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let index_path = tableView.indexPath(for: cell) {
            let r = restaurant_array[index_path.row]
            let detail_view_controller = segue.destination as! RestaurantDetailViewController
            detail_view_controller.r = r
        }
    }
    
    // search bar
    func searchbar(_ search_bar: UISearchBar, textDidChange searchText: String) {
        
        
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
