//
//  ViewController.swift
//  davaleba23
//
//  Created by Kote Ghudushauri on 5/18/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit


struct ColorsResponse: Codable {
    
    let colors: [Color]
    
    enum CodingKeys: String, CodingKey {
        case colors = "data"
    }
}




struct Color: Codable {
    let id            : Int
    let name          : String
    let year          : Int
    let color         : String
    let pantoneValue  : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case year
        case color
        case pantoneValue = "pantone_value"
    }
}


class ViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    var colors = [Color]()


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        getColors()
        
    }

    
    
    
    func getColors() {
        let url = URL(string: "https://reqres.in/api/unknown")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let colorResponse = try decoder.decode(ColorsResponse.self, from: data)
                
                self.colors.append(contentsOf: colorResponse.colors)
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
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let color = colors[indexPath.row]
        let backColor = UIColor(hex: color.color)

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as! CollectionCell
        cell.hexoncelllable.text = color.color
        cell.nameoncelllabel.text = color.name
        cell.backgroundColor = backColor
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let jokeVC = storyboard?.instantiateViewController(identifier: "secondpage_id") as! secondVC
        let color = colors[indexPath.row]
        let backColor = UIColor(hex: color.color)
        jokeVC.view.backgroundColor = backColor
        navigationController?.pushViewController(jokeVC, animated: true)
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout
    collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:
    IndexPath) -> CGSize
    {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        let collectionViewSize = collectionView.frame.size.width / 2
        return CGSize(width: collectionViewSize, height: 300)
    }
}



extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt32 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
