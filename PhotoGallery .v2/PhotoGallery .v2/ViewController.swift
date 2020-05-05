//
//  ViewController.swift
//  PhotoGallery .v2
//
//  Created by Kote Ghudushauri on 5/5/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colectionview: UICollectionView!
    @IBOutlet weak var Bigimage: UIImageView!
    
    var selectionarray = ["xinkali","carbonara","burger","ceasarsalad"]
    var selected: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colectionview.delegate = self
        colectionview.dataSource = self
            
            
            Bigimage.isUserInteractionEnabled = true
            let tapgesture = UITapGestureRecognizer(target: self, action: #selector(self.onimageclicked))
            Bigimage.addGestureRecognizer(tapgesture)
        }
        
        
        
        @objc func onimageclicked(){
            if Bigimage.image == UIImage(named: "xinkali"){
                selected = "xinkali"
            }  else if Bigimage.image == UIImage(named: "carbonara"){
                selected = "carbonara"
                
            } else if Bigimage.image == UIImage(named: "burger"){
                selected = "burger"
            }else if Bigimage.image == UIImage(named: "ceasarsalad"){
                selected = "ceasarsalad"
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "secondpage_id") as! SecondPageViewController
            VC.selection = selected
            self.navigationController?.pushViewController(VC, animated: true)
        }
        
        
    }



extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectionarray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cv_id", for: indexPath) as! CollectionViewCell
        cell.imaegview.image = UIImage(named: selectionarray[indexPath.row])
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        return cell
        
    }
    
    
}
extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Bigimage.image = UIImage(named: selectionarray[indexPath.row])
    
    }
}
