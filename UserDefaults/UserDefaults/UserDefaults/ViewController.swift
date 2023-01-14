//
//  ViewController.swift
//  UserDefaults
//
//  Created by Gerardo Paxtian on 15/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        defaults.set(22, forKey:"bday")
        defaults.set(true, forKey: "darkmode")
        
        let fruits = ["apple", "banana","mango"]
        defaults.set(fruits, forKey: "frutas")
        
        //diccionario
        let dic = ["wifi": true, "bluetooth": false, "phone":true]
        defaults.set(dic, forKey: "diccionario")
        
        //Reading set defaults
        
        let saveBday = defaults.integer(forKey: "bday")
        print ("Debug: Int", saveBday)
        
        print ("Debug: dic", dic)
        
        print ("Debug: dic", fruits)
        
        let fruitsObjet = defaults.object(forKey: "frutas") as? [String] ?? []
        print("Debug Object,  ", fruitsObjet)
        
        // storing custom object in UserDafasults
        
        let user = User(name:"Gerardo", age: 57)
        
        if let encoderUser = try? JSONEncoder().encode(user) {
            defaults.set(encoderUser, forKey: "User")
        }
        
        if let savedUserData = defaults.object(forKey: "User") as? Data {
            
            if let savedUser = try? JSONDecoder().decode(User.self, from: savedUserData){
                print ("Saved user: ", savedUser)
            }
        }
        
    }
}
struct User: Codable{
    let name: String
    let age: Int
}

