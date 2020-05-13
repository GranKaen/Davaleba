//
//  FilterViewController.swift
//  Davaleba20v2
//
//  Created by Kote Ghudushauri on 5/13/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

protocol filterProtocol{
    func onFilter(date: String)
}

class FilterViewController: UIViewController {

    @IBOutlet weak var filterPicker: UIPickerView!
    
    var delegate: filterProtocol?
    var numbers = Array(0...59)
    var firstSR = 0
    var secondSR = 0
    var filterDate: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filterPicker.dataSource = self
        filterPicker.delegate = self
        
    }
    
    @IBAction func filterButton(_ sender: UIButton) {
        
    filterDate = "\(firstSR):\(secondSR)"
    delegate?.onFilter(date: filterDate)
    }
    
}
extension FilterViewController: UIPickerViewDataSource{
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
        firstSR = pickerView.selectedRow(inComponent: 0)
        secondSR = pickerView.selectedRow(inComponent: 1)
    }
    
}

extension FilterViewController: UIPickerViewDelegate {
    
}
