//
//  ViewController.swift
//  Davaleba7v2
//
//  Created by Kote Ghudushauri on 4/23/20.
//  Copyright © 2020 Homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Input1: UITextField!
    
    @IBOutlet weak var Input2: UITextField!
    
    @IBOutlet weak var Answer: UILabel!
    
    @IBOutlet weak var slide: UISlider!
    
    @IBOutlet weak var HidenAnswer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func FontisZoma(_ sender: UISlider) {
        let font_size = CGFloat(slide.value)
        Answer.font = UIFont(name: Answer.font.fontName, size: font_size)
        
        Answer.sizeToFit()
    }
    
    
    @IBAction func OperatorSwitch(_ sender: UISegmentedControl) {
        let firstnum = Double(Input1.text!)!
        let secondnum = Double(Input2.text!)!
 switch sender.selectedSegmentIndex{
    case 0:
            print("")
    case 1:
        HidenAnswer.text = String(firstnum + secondnum)
    case 2:
        HidenAnswer.text = String(firstnum - secondnum)
    case 3:
        HidenAnswer.text = String(firstnum / secondnum)
    case 4:
        HidenAnswer.text = String(firstnum * secondnum)
    default:
    print("")

        }
        
        
        
        
        
        
    }
    
    @IBAction func Calculate(_ sender: Any) {
        Answer.text = HidenAnswer.text
    }
    
    
    
    

}

