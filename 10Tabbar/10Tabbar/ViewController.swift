//
//  ViewController.swift
//  05PickerView
//
//  Created by rentalhub-16pro on 2022/07/12.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickNum = 1;
    var component = 0;
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var fileName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        imgView.image=UIImage.init(named:String(pickNum))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 250
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imgView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imgView.image = UIImage(named: "\(row+1)")
        return imgView
    }

//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "\(row+1)"
//    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickNum = row+1
        
        if component == 0{
            fileName.text = "\(pickNum)"
        }else{
            imgView.image=UIImage.init(named:String(pickNum))
        }
    }

}

