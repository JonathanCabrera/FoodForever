//
//  RestaurantTableViewCell.swift
//  FoodForever
//
//  Created by Jacob Ortiz on 11/12/20.
//  Copyright © 2020 jacobortiz. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurant_name: UILabel!
    @IBOutlet weak var restaurant_image: UIImageView!
    
    @IBOutlet weak var category_label: UILabel!
    @IBOutlet weak var reviews_label: UILabel!
    @IBOutlet weak var phone_label: UILabel!
    
    var r: Restaurant! {
        didSet {
            restaurant_name.text = r.name
            restaurant_name.sizeToFit()
            
            category_label.text = r.main_category
            category_label.sizeToFit()
            
            phone_label.text = r.phone
            reviews_label.text = String(r.reviews) + " reviews"
            
            // images
            restaurant_image.af.setImage(withURL: r.image_url!)
            restaurant_image.layer.cornerRadius = 10
            restaurant_image.clipsToBounds = true
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
