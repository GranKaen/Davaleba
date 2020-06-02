//
//  ViewController.swift
//  notifications1
//
//  Created by konstantine gudushauri on 6/2/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var taskfield: UITextField!
    @IBOutlet weak var hhfield: UITextField!
    @IBOutlet weak var mmfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        onRegister()
    }
    
    
    
    func onRegister(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]){ (granted, err) in
            if granted {
                print("Agreed")
            } else{
                print("Disagreed")
            }
            
        }
        
    }
    func onSchedule(){
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Shexseneba!!!!"
        content.body = "\(taskfield.text ?? "")"
        content.sound = UNNotificationSound.default
        
        var datecomponents = DateComponents()
        datecomponents.hour = Int(hhfield.text!)!
        datecomponents.minute = Int(mmfield.text!)!
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: datecomponents, repeats: true)
        
        let req = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(req)
    }
    
    
    
    @IBAction func notificationbutton(_ sender: UIButton) {
        
        let hh = Int(hhfield.text!)!
        let mm = Int(mmfield.text!)!
        
        if hh < 24 && hh > 0 && mm < 60 && mm > 0 {
            onSchedule()
        }
        else{
            print("Need Int")
        }
    }
    

}

