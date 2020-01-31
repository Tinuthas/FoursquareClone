//
//  PlacesViewController.swift
//  FoursquareClone
//
//  Created by Marcus Vinicius Galdino Medeiros on 04/01/20.
//  Copyright © 2020 Marcus Vinicius Galdino Medeiros. All rights reserved.
//

import UIKit
import Parse

class PlacesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var placesNameArray = [String]()
    var placesIdArray = [String]()
    var selectedPlaceId = ""

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutButtonClicked))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromParse()

    }
    
    @objc func addButtonClicked(){
        self.performSegue(withIdentifier: "toAddPlaceVC", sender: nil)
    }
    
    @objc func logoutButtonClicked(){
        PFUser.logOutInBackground { (error) in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error Logout")
            }else {
                self.performSegue(withIdentifier: "toSignVC", sender: nil)
            }
        }
    }
    
    func getDataFromParse(){
        let query = PFQuery(className: "Places")
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error Logout")
            }else {
                if objects != nil {
                    self.placesNameArray.removeAll(keepingCapacity: false)
                    self.placesIdArray.removeAll(keepingCapacity: false)
                    for object in objects! {
                        if let placeName = object.object(forKey: "name") as? String {
                            if let placeId = object.objectId {
                                self.placesNameArray.append(placeName)
                                self.placesIdArray.append(placeId)
                            }
                        }
                    }
                    self.tableView.reloadData()
                }
               
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = placesNameArray[indexPath.row]
        return cell
    }
    
    func makeAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.chosenPlaceId = selectedPlaceId
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlaceId = placesIdArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

    

}
