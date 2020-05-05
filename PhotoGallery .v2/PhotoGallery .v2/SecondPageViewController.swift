//
//  SecondPageViewController.swift
//  PhotoGallery .v2
//
//  Created by Kote Ghudushauri on 5/5/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class SecondPageViewController: UIViewController {
    var italianarray = ["bolognese","carbonara","lasagna","putanesca"]
    var fastfoodarray = ["burger","friedchicken","friedpotatoes","shaurma" ]
    var saladsarray = ["ceasarsalad","greeksalad","mwvanesalati","fruitsalad"]
    var qartuliarray = ["xinkali","lobiani","mwvadi","xachapuri"]
    
    
    @IBOutlet weak var secondpagecolectionview: UICollectionView!
    
    var selection = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondpagecolectionview.delegate = self
        secondpagecolectionview.dataSource = self
        
    }
    


}
extension SecondPageViewController: UICollectionViewDelegate{
    
}

extension SecondPageViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "second_cell", for: indexPath) as! SecondPageCollectionViewCell
        
        
        if selection == "xinkali"{
            cell.imageview.image = UIImage(named: qartuliarray[indexPath.row])
        } else if selection == "carbonara" {
            cell.imageview.image = UIImage(named: italianarray[indexPath.row])
        } else if selection == "burger" {
                   cell.imageview.image = UIImage(named: fastfoodarray[indexPath.row])
        }else if selection == "ceasarsalad"{
            cell.imageview.image = UIImage(named: saladsarray[indexPath.row])
        }
        
            
        
        
        return cell
    }
}
