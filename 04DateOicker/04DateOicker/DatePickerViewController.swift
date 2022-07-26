//
//  ViewController.swift
//  04DateOicker
//
//  Created by rentalhub-16pro on 2022/07/12.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var tempText: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var userTime: UILabel!
    
    var pickTime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        currentTime.text = formatter.string(from: Date())
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.currentTime.text = formatter.string(from: Date.init())
            
            if self.currentTime.text?.contains(self.userTime.text!) == true{
                self.view.backgroundColor = .darkGray
                self.tempText.text = "🤮"
            }else{
                self.view.backgroundColor = .systemBackground
                self.tempText.text = ""
            }
        }
        
    }

    @IBAction func timeChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        userTime.text = formatter.string(from: sender.date)
        pickTime = formatter.string(from: sender.date)
        
    }
    
}

