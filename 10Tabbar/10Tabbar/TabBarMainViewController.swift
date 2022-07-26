//
//  ViewController.swift
//  10Tabbar
//
//  Created by rentalhub-16pro on 2022/07/19.
//

import UIKit

class TabBarMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func moveImgView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func moveImgPickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    @IBAction func moveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
}

