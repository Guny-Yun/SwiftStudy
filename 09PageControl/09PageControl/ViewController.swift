//
//  ViewController.swift
//  09PageControl
//
//  Created by rentalhub-16pro on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flowerImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        let fileName = String(format: "%02d",sender.currentPage + 1)

        flowerImageView.image = UIImage.init(named: fileName)
    }
    
}

