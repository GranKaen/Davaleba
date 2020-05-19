//
//  ViewController.swift
//  Davaleba24
//
//  Created by Kote Ghudushauri on 5/19/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
struct BandsResponse: Codable {
    let bands: [Band]
    
}
struct Band: Codable {
    let name: String
    let imgURL, thumb1, thumb2, thumb3: String
    let info, genre: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imgURL = "img_url"
        case thumb1, thumb2, thumb3, info, genre
    }
    
}
class ViewController: UIViewController {
    @IBOutlet weak var collectionview: UICollectionView!
    var bands = [Band]()
    let index = [0,1,2,3,4,5,6,7,8,9,10]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        getBand()
        print("viewdidload")
        
        // Do any additional setup after loading the view.
    }
    func getBand() {
        let url = URL(string: "http://www.mocky.io/v2/5ec3e47a300000e4b039c515")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let bandResponse = try decoder.decode(BandsResponse.self, from: data)
                
                self.bands.append(contentsOf: bandResponse.bands)
                DispatchQueue.main.async {
                    self.collectionview.reloadData()
                }
            } catch {print(error.localizedDescription)}
            
        }.resume()
    }
}

extension ViewController: UICollectionViewDelegate{
    
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let band = bands[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bendebi_id", for: indexPath) as! BendebiCell
        band.imgURL
            .downloadImage { (image) in
            DispatchQueue.main.async {
                cell.bendimageoncell.image = image
            }
        }
        cell.bandnameoncell.text = band.name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let infoVC = storyboard?.instantiateViewController(identifier: "simgerebisVC_id") as! SimgerebisVC
        let band = bands[indexPath.row]
        let index = self.index[indexPath.row]
        infoVC.index = index
        infoVC.band = band.name
        infoVC.info = band.info
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size.width / 2
        return CGSize(width: size, height: size)
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
