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

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            let user = PFUser()
            user.username = usernameText.text!
            user.password = passwordText.text!
            
            user.signUpInBackground { (success, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error!!")
                }else{
                    print("OK!")
                }
            }
        }else {
            makeAlert(title: "Error", message: "Username / Password??")
        }
    }
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let addButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(addButton)
        self.present(alert, animated: true, completion: nil)
    }
    
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
    }
    
    let query = PFQuery(className: "Fruits")
    query.whereKey("calories", greaterThan: 120)
    query.findObjectsInBackground { (objects, error) in
        if error != nil {
            print(error?.localizedDescription)
        }else {
            print(objects)
        }
    }*/
    

}

