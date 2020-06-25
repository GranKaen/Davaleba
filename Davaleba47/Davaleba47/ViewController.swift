//
//  ViewController.swift
//  Davaleba47
//
//  Created by konstantine gudushauri on 6/24/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout{
    
    let collers = ["red","green","blue"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var backgroundimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath)
            as! CollectionViewCell
        let collor = collers[indexPath.row]
        
        let image: UIImage = UIImage(named: collor)!
        cell.image.image = image
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "second_id") as? SecondViewController else {
                return
            }
            
            vc.modalPresentationStyle = .fullScreen
            
            present(vc, animated: true, completion: nil)
        
        let collor = collers[indexPath.row]
        
        let image: UIImage = UIImage(named: collor)!
        
        vc.backgroundImageView.image = image
        }    
}

