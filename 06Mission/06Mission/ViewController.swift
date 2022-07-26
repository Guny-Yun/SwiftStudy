//
//  ViewController.swift
//  06Mission
//
//  Created by rentalhub-16pro on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var userTime: UILabel!
    
    var alarmTime: String?
    var currenTm: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        currentTime.text = formatter.string(from: Date())
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.currentTime.text = formatter.string(from: Date.init())
            
        }
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        userTime.text = formatter.string(from: sender.date)
        alarmTime = formatter.string(from: sender.date)
    }
    
}

