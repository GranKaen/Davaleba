//
//  ViewController.swift
//  Davaleba folderebis sheqmna
//
//  Created by Kote Ghudushauri on 5/11/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController, passDataToFirst {
    
    @IBOutlet weak var collectionview: UICollectionView!
    let filmanager = CustomFileManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionview.dataSource = self
        collectionview.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddFolder(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addFolderPage = storyboard.instantiateViewController(withIdentifier: "addfolder_id") as! AddFolderViewController
            addFolderPage.directoryProtocol = self
        
        self.navigationController?.pushViewController(addFolderPage, animated: true)
        
    }
    
    func passDirectory(folder: String) {


        if !filmanager.dirExists(dir: folder){
        filmanager.createDirectory(name: folder)
        }
        collectionview.reloadData()
    }


}
extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let fullViewPage = storyboard.instantiateViewController(withIdentifier: "folderview_id") as! FolderViewViewController
        let arrayOfFolders = filmanager.contentsOfURL(url: filmanager.mainPath)
        
        fullViewPage.folderName = arrayOfFolders[indexPath.row].lastPathComponent
     
        self.navigationController?.pushViewController(fullViewPage, animated: true)
    }
    }
    
    

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let arrayOfFolders = filmanager.contentsOfURL(url: filmanager.mainPath)
        return arrayOfFolders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let arrayOfFolders = filmanager.contentsOfURL(url: filmanager.mainPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.Foldername.text = arrayOfFolders[indexPath.row].lastPathComponent
        
        return cell
    }
    
    
   
    
}
