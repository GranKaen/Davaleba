//
//  ViewController.swift
//  Davaleba_animation
//
//  Created by konstantine gudushauri on 5/27/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dropdownview: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var plusview: UIView!
    var shapes1 = ["square1","star1","circle1","triangle1"]
    var shapes = ["square","star","circle","triangle"]
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
    
    func animateView() {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 0.2, options: [], animations: {
            self.dropdownview.frame.origin.y += 250
            self.tableView.frame.origin.y += 100
            self.plusview.isHidden = true
        }) { (f) in
        }
    }
    func unAnimateView() {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 0.2, options: [], animations: {
            self.dropdownview.frame.origin.y -= 250
            self.tableView.frame.origin.y -= 100
        }) { (f) in
                    self.plusview.isHidden = false
        }
    }
    func disappearView(figure: String) {
        shapes.append(figure)
        shapes1.append("\(figure)1")
        UIView.transition(with: dropdownview, duration: 0.4, options: .transitionFlipFromBottom,
                          animations: {}, completion: nil)
        UIView.animate(withDuration: 0.35, delay: 0, options: [], animations: {
            self.dropdownview.alpha = 0
        }) { (f) in
            self.dropdownview.frame.origin.y -= 250
            self.dropdownview.alpha = 1
            self.tableView.frame.origin.y -= 100
            self.plusview.isHidden = false
            self.tableView.reloadData()
        }
    }
    @IBAction func onplustap(_ sender: UITapGestureRecognizer) {
        animateView()
        tableView.reloadData()
    }
    @IBAction func onXtap(_ sender: UITapGestureRecognizer) {
         unAnimateView()
    }
    @IBAction func oncircletap(_ sender: UITapGestureRecognizer) {
        disappearView(figure: "circle")
    }
    @IBAction func onsquaretap(_ sender: UITapGestureRecognizer) {
        disappearView(figure: "square")
    }
    @IBAction func onstartap(_ sender: UITapGestureRecognizer) {
        disappearView(figure: "star")
    }
    @IBAction func ontriangletap(_ sender: UITapGestureRecognizer) {
        disappearView(figure: "triangle")
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
