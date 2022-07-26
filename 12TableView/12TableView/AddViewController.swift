//
//  AddViewController.swift
//  12TableView
//
//  Created by rentalhub-16pro on 2022/07/25.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    var component = 0;
    var imageArray: [String] = ["cart", "clock", "pencil"]
    @IBOutlet weak var pickerViewImage: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var inputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        pickerView.dataSource = self
        pickerView.delegate = self
        
    }
    
    @IBAction func addButtonAction(_ sender:Any){
        titleArray.append(inputTextField.text!)
        imageARray.append("cart")
        
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 250
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imgView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
       // imgView.image = UIImage(named: imageArray[IndexPath.row])
        return imgView
    }

//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "\(row+1)"
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        pickNum = row+1
//
//        if component == 0{
//            fileName.text = "\(pickNum)"
//        }else{
//            imgView.image=UIImage.init(named:String(pickNum))
//        }
//    }

}
