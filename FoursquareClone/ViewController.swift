//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Marcus Vinicius Galdino Medeiros on 29/12/19.
//  Copyright © 2019 Marcus Vinicius Galdino Medeiros. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Banana"
        parseObject["calories"] = 150
        parseObject.saveInBackground { (success, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }else{
                print("uploaded")
            }
        }*/
        
        let query = PFQuery(className: "Fruits")
        query.whereKey("calories", greaterThan: 120)
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                print(objects)
            }
        }
    }


}

