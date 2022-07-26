//
//  EditViewController.swift
//  11Navigation
//
//  Created by rentalhub-16pro on 2022/07/19.
//

import UIKit

protocol UserEditDelegate: AnyObject {
    func editComplete(message: String?, lampOnOff: Bool, zoom: Bool)
}

class EditViewController: UIViewController {

    @IBOutlet weak var segueLabel: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBOutlet weak var messageTextField: UITextField!
    
    
    var message: String?
    var segueId: String?
    var flag:Bool = true
    
    weak var delegate: UserEditDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messageTextField.text = message
        segueLabel.text = segueId
        
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        delegate?.editComplete(message: messageTextField.text, lampOnOff: onOffSwitch.isOn, zoom: flag)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func zoomAction(_ sender: UIButton) {
        flag = !flag
        if flag {
            sender.setTitle("확대", for: .normal)
        }else {
            sender.setTitle("축소", for: .normal)
        }
        
    }
    
    
    

}
