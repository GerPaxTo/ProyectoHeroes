//
//  SettingsViewController.swift
//  Proyecto MVC
//
//  Created by Gerardo Paxtian on 28/12/22.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var settings: [String] = []
    
    @IBOutlet weak var settingsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settings = ["Logout"]
        
        settingsTable.delegate = self
        settingsTable.dataSource = self
        navigationItem.title = "Settings"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "myCell")
        cell.textLabel?.text = settings[indexPath.row]
        cell.imageView?.image = UIImage(systemName: "person.fill.xmark")!
        return cell
    }
    
    func settingsTable(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = settings[indexPath.row]
        
        print(option)
        if option == "Logout" {
            LocalDataLayer.shared.delete()
            
            DispatchQueue.main.async {
                UIApplication
                    .shared
                    .connectedScenes
                    .compactMap{ ($0 as? UIWindowScene)?.keyWindow }
                    .first?
                    .rootViewController = LoginViewController()
            }
        }
        
    }
    
}
