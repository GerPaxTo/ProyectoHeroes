//
//  LoginViewController.swift
//  Proyecto MVC
//
//  Created by Gerardo Paxtian on 15/12/22.
// gerpaxto@gmail.com

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var accessButom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        userText.center.x -= view.bounds.width
        passwordText.center.x -= view.bounds.width
        accessButom.alpha = 0
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: []) {
            self.userText.center.x += self.view.bounds.width
            self.passwordText.center.x += self.view.bounds.width
        }
        
        UIView.animate(withDuration: 3) {
            self.accessButom.alpha = 1
        }
        
    }
    
    
    @IBAction func accessButtomTapped(_ sender: UIButton) {
        guard let email = userText.text, !email.isEmpty else {
            print ("email is empty")
            return
        }
        
        guard let password = passwordText.text, !password.isEmpty else {
            print ("password is empty")
            return
        }
        
        NetworkLayer.shared.login(email: email, password: password) { token, error in
            if let token = token {
                LocalDataLayer.shared.save(token: token)
                print("We got a valid Token")
                print (token)
                
                DispatchQueue.main.async {
                
                    UIApplication
                        .shared
                        .connectedScenes
                        .compactMap{ ($0 as? UIWindowScene)?.keyWindow }
                        .first?
                        .rootViewController = HomeTabBarController()
                }
                
            } else {
                print(email)
                print(password)
                print("Login error", error?.localizedDescription ?? "")
            }
        }
    }
}
