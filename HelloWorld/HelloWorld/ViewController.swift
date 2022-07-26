//
//  ViewController.swift
//  HelloWorld
//
//  Created by rentalhub-16pro on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func okButtonACtion(_ sender: Any) {
        
        print("확인버튼눌림")
        print(nameTextField.text!)
        helloLabel.text = "Hello~  \(nameTextField.text!)"
    }
    
}

