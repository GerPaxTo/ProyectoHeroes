//
//  MapViewController.swift
//  Proyecto MVC
//
//  Created by Gerardo Paxtian on 09/01/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var location: [Locations]!
    var heroe: Heroe!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addLocationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var i = 0
        
        for punto in location {
            print(punto)
            
            let coodenada = MKPointAnnotation()
            
            let lat = Double(punto.latitud)
            let long = Double(punto.longitud)
            
            coodenada.coordinate = CLLocationCoordinate2D(latitude: lat ?? 0, longitude: long ?? 0)
            coodenada.title = heroe.name
            
            mapView.addAnnotation(coodenada)
            if i == 0 {
                let region = MKCoordinateRegion(center: coodenada.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
                if region.center.latitude >= -90 && region.center.latitude <= 90 && region.center.longitude >= -180 && region.center.longitude <= 180 {
                    mapView.setRegion(region, animated: true)
                    i += 1
                }
                
            }
         }
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        let addController = AddLocationController()
        addController.heroe = heroe
        navigationController?.pushViewController(addController, animated: true)
    }
}
