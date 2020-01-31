//
//  DetailsViewController.swift
//  FoursquareClone
//
//  Created by Marcus Vinicius Galdino Medeiros on 29/01/20.
//  Copyright © 2020 Marcus Vinicius Galdino Medeiros. All rights reserved.
//

import UIKit
import MapKit
import Parse

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailsNameLabel: UILabel!
    @IBOutlet weak var detailsAtmosphereLabel: UILabel!
    @IBOutlet weak var detailsTypeLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var chosenPlaceId = ""
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromParse()
        
    }
    
    func getDataFromParse(){
        let query = PFQuery(className: "Places")
        query.whereKey("objectId", equalTo: chosenPlaceId)
        query.findObjectsInBackground { (objects, error) in
            if error != nil{
                
            }else{
                if objects != nil && objects?.count ?? 0 > 0{
                    let chosenPlaceObject = objects![0]
                    if let placeName = chosenPlaceObject.object(forKey: "name") as? String {
                        self.detailsNameLabel.text = placeName
                    }
                    if let placeType = chosenPlaceObject.object(forKey: "tyoe") as? String {
                        self.detailsTypeLabel.text = placeType
                    }
                    if let placeAtmosphere = chosenPlaceObject.object(forKey: "atmosphere") as? String {
                        self.detailsAtmosphereLabel.text = placeAtmosphere
                    }
                    if let placeLatitude = chosenPlaceObject.object(forKey: "latitude") as? String{
                        if let placeLatitudeDouble = Double(placeLatitude) {
                            self.chosenLatitude = placeLatitudeDouble
                        }
                    }
                    
                    if let placeLongitude = chosenPlaceObject.object(forKey: "longitude") as? String{
                        if let placeLongitudeDouble = Double(placeLongitude) {
                            self.chosenLatitude = placeLongitudeDouble
                        }
                    }
                    
                    if let imageData = chosenPlaceObject.object(forKey: "image") as? PFFileObject{
                        imageData.getDataInBackground { (data, error) in
                            if error == nil {
                                if data != nil {
                                    self.imageView.image = UIImage(data: data!)
                                }
                            
                            }
                        }
                    }
                    
                }
            }
        }
    }

}
