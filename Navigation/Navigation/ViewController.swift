//
//  ViewController.swift
//  Navigation
//
//  Created by rentalhub-16pro on 2022/07/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func movePageAction(_ sender: UIButton) {
        performSegue(withIdentifier: "page2Segue", sender: nil)
        
    }
    

}

