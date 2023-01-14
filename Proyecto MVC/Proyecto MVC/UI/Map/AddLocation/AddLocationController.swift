//
//  AddLocationController.swift
//  Proyecto MVC
//
//  Created by Gerardo Paxtian on 11/01/23.
//

import UIKit

class AddLocationController: UIViewController {

    @IBOutlet weak var labeHero: UILabel!
    @IBOutlet weak var imgHeroe: UIImageView!
    @IBOutlet weak var longitudText: UITextField!
    @IBOutlet weak var latitudText: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    var heroe: Heroe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgHeroe.setImage(url: heroe.photo)
        labeHero.text = heroe.name
    }

    @IBAction func addTapped(_ sender: UIButton) {
        guard let longDato = longitudText.text, !longDato.isEmpty else {
            return
        }
        
        guard let latDato = latitudText.text, !latDato.isEmpty else {
            return
        }
        
        let datoLo = convertDouble(dato: longDato)
        let datoLa = convertDouble(dato: latDato)
        
        if datoLo == 0 || datoLa == 00 {
            return
        }
        
        let token = LocalDataLayer.shared.getToken()
        
        var newLocation = NewLocation(id: "",latitud: "", longitud: "")
        
        newLocation.id = self.heroe.id
        newLocation.longitud = String(datoLo)
        newLocation.latitud = String(datoLa)
        
        
        NetworkLayer.shared.newLocation(token: token, location: newLocation)  {  [weak self]  respuesta, error in
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
    
    func convertDouble(dato: String) -> Double {
        guard let doubleDato = Double(dato) else {return 0}
        return doubleDato
    }
}
