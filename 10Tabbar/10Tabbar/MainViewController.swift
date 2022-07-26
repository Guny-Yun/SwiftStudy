//
//  ViewController.swift
//  03Zoom
//
//  Created by rentalhub-16pro on 2022/07/11.
//

import UIKit

class MainViewController: UIViewController {

    
    var flag = true
    var isOn: UIImage?
    var isOff: UIImage?
    
    @IBOutlet weak var lampImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lampImageView.image=UIImage.init(named:"lamp_off")
        
        isOn = UIImage.init(named:"lamp_on.png")
        isOff = UIImage.init(named:"lamp_off.png")
        
        lampImageView.image = isOff
    }
    
    
    @IBAction func zoomButtonAction(_ sender: UIButton) {
        if flag {
            lampImageView.frame.size.width *= 2
            lampImageView.frame.size.height *= 2
            sender.setTitle("확대", for: .normal)
        }else {
            lampImageView.frame.size.width /= 2
            lampImageView.frame.size.height /= 2
            sender.setTitle("축소", for: .normal)
        }
        flag = !flag
    }
    
    
    @IBAction func lampOnOffSwitch(_ sender: UISwitch) {
        if sender.isOn{
            lampImageView.image = isOn
        }else{
            lampImageView.image = isOff
        }
        
    }
}

