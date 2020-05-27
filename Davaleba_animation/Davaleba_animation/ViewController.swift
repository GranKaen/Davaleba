//
//  ViewController.swift
//  Davaleba_animation
//
//  Created by konstantine gudushauri on 5/27/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let shapes1 = ["square1","star1","circle1","triangle1"]
    let shapes = ["square","star","circle","triangle"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    func animatePic(image: String) {
        let imageView = UIImageView(frame: CGRect(x: (view.frame.width / 2) - 100, y: view.frame.height, width: 200, height: 200))
        imageView.image = UIImage(named: image)
        self.view.addSubview(imageView)
        UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.65, initialSpringVelocity: 0.20, options: [], animations: {
                imageView.frame.origin.y -= 330
                imageView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            }) { (f) in
                UIView.animate(withDuration: 0.5, animations: {
                    imageView.frame.origin.y -= 0
                }) { (f) in
                    UIView.transition(with: imageView, duration: 0.4, options: .transitionFlipFromBottom,
                                      animations: {}, completion: nil)
                    UIView.animate(withDuration: 0.35, delay: 0, options: [], animations: {
                        imageView.alpha = 0
                    }) { (f) in
                    imageView.removeFromSuperview()
                    }
                }
            }
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shapes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let figure = shapes1[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id") as! CellVC
        cell.imageoncell.image = UIImage(named: figure)
        cell.nameoncell.text = figure
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shape = shapes[indexPath.row]
        self.animatePic(image: shape)
    }
}
