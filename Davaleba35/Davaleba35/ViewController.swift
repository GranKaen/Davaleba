//
//  ViewController.swift
//  Davaleba35
//
//  Created by konstantine gudushauri on 6/7/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit
import CoreData
import SkeletonView

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
        var characters = [Character]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.showAnimatedGradientSkeleton()
        tableview.rowHeight = 250
        tableview.delegate = self
        tableview.dataSource = self
        getCharacters{
            self.view.hideSkeleton()
        }
    }
    override func viewDidLayoutSubviews() {
        view.layoutSkeletonIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.layoutIfNeeded()
        tableview.showAnimatedGradientSkeleton()
        
    }
    
    func getCharacters(completion: @escaping ()->()) {
                
        let url = URL(string: "https://rickandmortyapi.com/api/character/")!
                
        URLSession.shared.dataTask(with: url) { (data, res, err) in
                    
            guard let data = data else {return}
                    
            do {
                let decoder = JSONDecoder()
                    let charactersResponse = try
                        decoder.decode(CharactersResponse.self,from: data)
                                        
                self.characters.append(contentsOf: charactersResponse.characters)
                        
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
                        
            } catch {print(error)}
                    
        }.resume()
    }
            
}
extension ViewController: UITableViewDelegate{
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = characters[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id") as! TableVC
        cell.nameoncell.text = result.name
        cell.nicknameoncell.text = result.gender
        cell.birthdayoncell.text = result.origin.name
        result.image.downloadImage{ (image) in
            DispatchQueue.main.async {
                cell.imageoncell.image = image
            }
        }
        return cell
    }
    
    
}
extension String {
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
}
