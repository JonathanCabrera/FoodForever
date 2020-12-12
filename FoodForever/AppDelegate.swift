//
//  AppDelegate.swift
//  FoodForever
//
//  Created by Jacob Ortiz on 11/3/20.
//  Copyright © 2020 jacobortiz. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let parseConfig = ParseClientConfiguration {
//                 $0.applicationId = "bUOvYHnLbHG0tHRFWJaJuBhuxlgDyTETq4XXnua6"
//                 $0.clientKey = "oRWHrF3xdzaDMggOTWK92spO6OIb95ywNQ9IOLMp"
                $0.applicationId = "MLsF8jFsZAfONtO7FnKC0VYbaRuzrHCFshMZLYMG" // <- UPDATE
                $0.clientKey = "6JLbQZ6urqJBOWPLT1R2F62o6WjmDTUabpUVDdP0" // <- UPDATE
                $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
        
        if PFUser.current() != nil {
          let main = UIStoryboard(name: "Main", bundle: nil)
            let restaurantsViewNavigationController = main.instantiateViewController(withIdentifier: "RestaurantsViewNavigationController")
            
            //window?.rootViewController = foodFeedNavigationController
        }
        
        return true
    }
}

