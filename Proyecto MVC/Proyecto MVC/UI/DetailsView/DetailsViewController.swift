//
//  DetailsViewController.swift
//  Proyecto MVC
//
//  Created by Gerardo Paxtian on 19/12/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var heroeImage: UIImageView!
    @IBOutlet weak var heroeNameLabel: UILabel!
    @IBOutlet weak var heroeDescriptionLabel: UILabel!
    @IBOutlet weak var transformacionesButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    
    var heroe: Heroe!
    var transformations: [Transformations] = []
    var locations: [Locations] = []
    var HeroeId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroeImage.setImage(url: heroe.photo)
        heroeNameLabel.text = heroe.name
        heroeDescriptionLabel.text = heroe.description
        navigationItem.title = heroe.name
        HeroeId = heroe.id
        
        if heroe.favorite {
            favButton.setBackgroundImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
        }else{
            favButton.setBackgroundImage(UIImage(systemName: "suit.heart"), for: .normal)
        }
        favButton.setTitle("", for:.normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 3) {
            self.heroeImage.alpha = 1
        }
        
        let token = LocalDataLayer.shared.getToken()
        
        NetworkLayer.shared.fetchTransformations(token: token, id: HeroeId) {  [weak self]  allTrans, error in
            guard let self = self else { return }
            
            if let allTrans = allTrans {
                self.transformations = allTrans
                
                if self.transformations.isEmpty {
                    DispatchQueue.main.async {
                        self.transformacionesButton.alpha = 0
                    }
                }
            } else {
                print ("Error")
            }
        }
        
        let tokenL = LocalDataLayer.shared.getToken()
        NetworkLayer.shared.fetchLocations(token: tokenL, id: HeroeId) {  [weak self]  allLocat, error in
            guard let self = self else { return }
            
            if let allLocat = allLocat {
                self.locations = allLocat
            } else {
                print ("No hay")
                DispatchQueue.main.async {
                    self.mapButton.alpha = 0
                }
            }
        }
    }
    
    @IBAction func transformacionesTapped(_ sender: UIButton) {
        let transformationsView = transformationsViewController()
        
        transformationsView.transformations = self.transformations.sorted{$0.name < $1.name}
        
        navigationController?.pushViewController(transformationsView, animated: true)
    }
    
    
    @IBAction func mapTapped(_ sender: UIButton) {
        let mapView = MapViewController()
        mapView.heroe = heroe
        
        mapView.location = locations
        navigationController?.pushViewController(mapView, animated: true)
    }
    
    @IBAction func favTapped(_ sender: UIButton) {
        let token = LocalDataLayer.shared.getToken()
        
        NetworkLayer.shared.marcaFavorito(token: token, id: heroe.id) {  [weak self]  respuesta, error in
            guard let self = self else { return }
            
            print(self)
            
            if let respuesta = respuesta {
                print(respuesta)
            } else {
                print ("Error")
            }
            
            DispatchQueue.main.async {
                UIApplication
                    .shared
                    .connectedScenes
                    .compactMap{ ($0 as? UIWindowScene)?.keyWindow }
                    .first?
                    .rootViewController = HomeTabBarController()
            }
            
        }
    }
    
}
