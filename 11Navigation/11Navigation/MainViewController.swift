//
//  ViewController.swift
//  11Navigation
//
//  Created by rentalhub-16pro on 2022/07/19.
//

import UIKit

extension MainViewController: UserEditDelegate{
    func editComplete(message: String?, lampOnOff: Bool, zoom:Bool) {
        messageTextField.text = message
        if lampOnOff{
            lampImageView.image = UIImage(named: "lamp_on")
        }else {
            lampImageView.image = UIImage(named: "lamp_off")
        }
        
        if zoom && !self.flag{
            lampImageView.frame.size.width *= 2
            lampImageView.frame.size.height *= 2
        }else if !zoom && self.flag {
            lampImageView.frame.size.width /= 2
            lampImageView.frame.size.height /= 2
        }
        self.flag = zoom
    }
}

class MainViewController: UIViewController {
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var lampImageView: UIImageView!

    var flag: Bool = false
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let editVC = segue.destination as? EditViewController {
            editVC.message = messageTextField.text
            editVC.delegate = self
            editVC.segueId = segue.identifier
        }
    }
    @IBAction func editButtonAction(_ sender: Any) {
        
    }
}

