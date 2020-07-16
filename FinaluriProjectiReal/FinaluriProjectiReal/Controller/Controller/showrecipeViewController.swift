//
//  showrecipeViewController.swift
//  FinaluriProjectiReal
//
//  Created by konstantine gudushauri on 7/13/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit
import CoreData

class showrecipeViewController: UIViewController {

    @IBOutlet var showImage: UIImageView!{
        didSet{
            showImage.layer.cornerRadius = showImage.frame.height/2
        }
    }
    @IBOutlet var namelable: UILabel!
    @IBOutlet var stepOneLable: UITextView!
    @IBOutlet var stepTwoLable: UITextView!
    @IBOutlet var stepThreeLable: UITextView!
    @IBOutlet var tipsLabel: UITextView!
    var recip: Recipes!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setinfo()
        // Do any additional setup after loading the view.
    }
    

    func setinfo() {
        namelable.text = recip.recipeName
        stepOneLable.text = recip.step1
        stepTwoLable.text = recip.step2
        stepThreeLable.text = recip.step3
        tipsLabel.text = recip.tips
            if (recip?.recipeImage) != nil {
                showImage.image = UIImage(data: (recip?.recipeImage)!)
                       }
        
    }
    
    
    @IBAction func onClose(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    

}
