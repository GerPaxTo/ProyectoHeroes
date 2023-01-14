//
//  CollectionViewController.swift
//  Proyecto MVC
//
//  Created by Gerardo Paxtian on 13/12/22.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchResultsUpdating  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var heroes: [Heroe] = []
    var filteredHeroes: [Heroe] = []
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.title = "Buscar Heroe"
        
        navigationItem.searchController = searchController
        navigationItem.title = "Heroes"
        
        collectionView.delegate = self
        collectionView.dataSource = self
         
        let xib = UINib(nibName: "CollectionCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "customCollectionCell")
        
        let token = LocalDataLayer.shared.getToken()
        
        NetworkLayer.shared.fetchHeroes(token: token) { [weak self] allHeroes, error in
            guard let self = self else { return }
            
            if let allHeroes = allHeroes {
                self.heroes = allHeroes
                self.filteredHeroes = allHeroes
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } else {
                print ("Error fetching heroes", error?.localizedDescription ?? "")
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredHeroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionCell", for: indexPath) as! CollectionCell
        let heroe = filteredHeroes[indexPath.row]
        cell.iconImageView.setImage(url: heroe.photo)
        cell.titleLabel.text = heroe.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsInRow: CGFloat = 2
        let spacing: CGFloat = 10
        let totalSpacing: CGFloat = (itemsInRow - 1) * spacing
        let finalWidth = (collectionView.frame.width - totalSpacing) / itemsInRow

        return CGSize(width: finalWidth, height: 120)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            if searchText == "" {
                filteredHeroes = heroes
                collectionView.reloadData()
            }else{
                filteredHeroes = heroes.filter {$0.name.contains(searchText)}
                collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let heroe = filteredHeroes[indexPath.row]
        let detailsView = DetailsViewController()
        
        detailsView.heroe = heroe
        navigationController?.pushViewController(detailsView, animated: true)
    }
}
