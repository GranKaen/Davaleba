//
//  onlinerecipeViewController.swift
//  FinaluriProjectiReal
//
//  Created by konstantine gudushauri on 7/13/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class onlinerecipeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource{
    
    let apiService = APIService()
    var viewmodel = [RecipeViewModel]()
    let suratebi = ["chicken","onion","apple"]
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.rowHeight = 128
        
        
        getinfo()
       
        
        
    }
    
    func getinfo() {
    apiService.searchRecipe { (hits) in
        for hit in hits {
            let recipe = RecipeViewModel(hit: hit)
            self.viewmodel.append(recipe)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.collectionView.reloadData()
            }
        }
        
    }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "online_tcell", for: indexPath) as! onlineRecipeTableViewCell
        
                let recip = self.viewmodel[indexPath.row]
        
            cell.onlineLabelOnCell.text = recip.recipeName
                recip.recipeimage.downloadImage{ (image) in
                    DispatchQueue.main.async {
                        cell.onlineImageOnCell.image = image
                    }
                }
            
        return cell
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suratebi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "online_ccell", for: indexPath) as! onlineCollectionViewCell
        
                
        let image = UIImage(named: suratebi[indexPath.row])
        cell.imageOnCCell.image = image
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        apiService.word = suratebi[indexPath.row]
        
        print(suratebi[indexPath.row])
        getinfo()
    }

}
