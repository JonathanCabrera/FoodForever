//
//  RestaurantTableViewCell.swift
//  FoodForever
//
//  Created by Jacob Ortiz on 11/12/20.
//  Copyright © 2020 jacobortiz. All rights reserved.
//

import UIKit
import Parse

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurant_name: UILabel!
    @IBOutlet weak var restaurant_image: UIImageView!
    
    @IBOutlet weak var category_label: UILabel!
    @IBOutlet weak var phone_label: UILabel!
    
    var r: Restaurant! {
        didSet {
            restaurant_name.text = r.name
            restaurant_name.sizeToFit()
            
            category_label.text = r.main_category
            category_label.sizeToFit()
            
            phone_label.text = r.phone
            
            // images
            restaurant_image.af.setImage(withURL: r.image_url!)
            restaurant_image.layer.cornerRadius = 10
            restaurant_image.clipsToBounds = true
        }
    }
    
    var isFav = UserDefaults.standard.bool(forKey: "isFav")

    @IBAction func favRest(_ sender: Any) {
        if (isFav) {
            let image = UIImage(named: "favor-icon")
            (sender as AnyObject).setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "favor-icon-red")
            (sender as AnyObject).setImage(image, for: .normal)
            print("is hearted")
        }

        isFav = !isFav
        UserDefaults.standard.set(isFav, forKey: "isFav")
        UserDefaults.standard.synchronize()
        
        let restaurant = PFObject(className: "restaurant")
        
        restaurant["name"] = restaurant_name.text
        restaurant["number"] = phone_label.text
        restaurant["category"] = category_label.text
        restaurant["person"] = PFUser.current()!
        
        
//        restaurant["image"] = restaurant_image.af.setImage(withURL: r.image_url!)
        
        restaurant.saveInBackground { (success, error) in
            if success {
                print("saved")
            } else {
                print("error")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
