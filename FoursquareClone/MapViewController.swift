//
//  MapViewController.swift
//  FoursquareClone
//
//  Created by Marcus Vinicius Galdino Medeiros on 28/01/20.
//  Copyright © 2020 Marcus Vinicius Galdino Medeiros. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(saveButtonClicked))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonClicked))
        print(PlaceModel.sharedInstance.placeName)
    }
    
    @objc func saveButtonClicked(){
        //PARSE
    }
    
    @objc func backButtonClicked(){
        //navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
        


}
