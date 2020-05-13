//
//  AddPadCastViewController.swift
//  Davaleba20v2
//
//  Created by Kote Ghudushauri on 5/13/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import CoreData
class AddPadCastViewController: UIViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var timePicker: UIPickerView!
    var numbers = Array(0...59)
    var newText: String?
    var newTitle: String?
    var newDate: String?
    var firstSR = 0
    var secondSR = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker.delegate = self
        timePicker.dataSource = self
        
    }

    @IBAction func addButton(_ sender: UIButton) {
        newTitle = titleField.text
        newText = textField.text
        newDate = "\(firstSR):\(secondSR)"
        save(title: newTitle!, text: newText!, date: newDate!)
        
    }
    
    
}

extension AddPadCastViewController: UIPickerViewDelegate {
    
}
extension AddPadCastViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numbers[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.firstSR = pickerView.selectedRow(inComponent: 0)
        self.secondSR = pickerView.selectedRow(inComponent: 1)

    }
    
    
}

extension AddPadCastViewController{
    func save(title: String, text: String, date: String){
        let appDel = UIApplication.shared.delegate as! AppDelegate
        
        let container = appDel.persistentContainer
        
        let context = container.viewContext
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "PodCast", in: context)
        
        let podCast = PodCast(entity: entityDescription!, insertInto: context)
        
        podCast.title = title
        podCast.text = text
        podCast.time = date
        
    }
    
    
    
}
