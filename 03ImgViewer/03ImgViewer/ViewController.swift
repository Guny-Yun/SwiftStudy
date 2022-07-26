//
//  ViewController.swift
//  03ImgViewer
//
//  Created by rentalhub-16pro on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {
    var imgNumber = 1;
    let totImg = 6;
    
    @IBOutlet weak var imgViewer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgViewer.image=UIImage.init(named:String(imgNumber))
    }
    
    
    @IBAction func nextBtn(_ sender: UIButton) {
        imgNumber += 1
        if imgNumber > totImg {
            imgNumber = 1
        }
        imgViewer.image = UIImage.init(named: String(imgNumber))
    }
    @IBAction func prevBtn(_ sender: UIButton) {
        imgNumber -= 1
        if imgNumber < 1 {
            imgNumber = 6
        }
        imgViewer.image = UIImage.init(named: String(imgNumber))
    }
}

