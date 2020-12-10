//
//  ProfileTableViewCell.swift
//  FoodForever
//
//  Created by Jonathan Cabrera on 12/8/20.
//  Copyright © 2020 jacobortiz. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurant_image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var r: Restaurant! {
        didSet {
            name.text = r.name
            name.sizeToFit()
            
            categoryLabel.text = r.main_category
            categoryLabel.sizeToFit()
            
            phoneLabel.text = r.phone
            
            // images
            restaurant_image.af.setImage(withURL: r.image_url!)
            restaurant_image.layer.cornerRadius = 10
            restaurant_image.clipsToBounds = true
        }
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
