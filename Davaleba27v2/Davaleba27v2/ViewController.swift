//
//  ViewController.swift
//  Davaleba27v2
//
//  Created by konstantine gudushauri on 5/26/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pick: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func printprime(){
        var primes = [Int]()
            for n in 2...100000 {
                if primes.allSatisfy({ n % $0 != 0 }) {
                    primes.append(n)
                }
            }
            print(primes)
}
    @IBAction func butto(_ sender: UIButton) {
        let disableMyButton = sender
        disableMyButton.isEnabled = false
        let group = DispatchGroup()
        let dispatchQueue = DispatchQueue(label: "primeQueue", qos: .background)
        dispatchQueue.async(group: group,  qos:.background) {
            self.printprime()
        }
        group.notify(queue: DispatchQueue.main, execute: {
        disableMyButton.isEnabled = true
        })
    }
}

