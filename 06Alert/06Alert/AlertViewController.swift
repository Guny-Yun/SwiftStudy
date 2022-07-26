//
//  ViewController.swift
//  06Alert
//
//  Created by rentalhub-16pro on 2022/07/18.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak var lampImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lampImageView.image = UIImage.init(named:"lamp-off")
        
    }

    var isLampOn = false
    
    @IBAction func lampOnAction(_ sender: Any) {
        if isLampOn {
            let onAlert = UIAlertController(title:"경고",message: "이미 램프가 켜져있습니다.",preferredStyle: .alert)
            let onAction = UIAlertAction(title:"넴ㅎ",style:.default, handler:nil)
            onAlert.addAction(onAction)
            present(onAlert, animated: true)
            
        }else{
            let alert = UIAlertController.init(title:"테이블", message:"램프를 켭니다.",preferredStyle: .alert)
            
            let action = UIAlertAction.init(title:"확인",style: .default, handler: {
                action in self.lampImageView.image = UIImage.init(named: "lamp-on")
            })
            let cancelAction = UIAlertAction(title:"아니오", style: .default, handler: nil)
            alert.addAction(action)
            alert.addAction(cancelAction)
            
            present(alert, animated: true)
            isLampOn = true
        }
    }
    
    @IBAction func lampOffAction(_ sender: Any) {
        if !isLampOn{
            let offAlert = UIAlertController(title:"경고",message: "이미 램프가 꺼져있습니다.",preferredStyle: .alert)
            let offAction = UIAlertAction(title:"넴ㅎ",style:.default, handler:nil)
            offAlert.addAction(offAction)
            present(offAlert, animated: true)
        }else{
            let alert = UIAlertController.init(title:"테이블", message:"램프를 끕니다.", preferredStyle: .alert)
            
            let action = UIAlertAction.init(title:"확인", style: .default,handler:{
                action in self.lampImageView.image = UIImage.init(named:"lamp-off")
            })
            
            let cancelAction = UIAlertAction(title:"아니오", style: .default, handler: nil)
            alert.addAction(action)
            alert.addAction(cancelAction)
            
            present(alert, animated: true)
            isLampOn = false
        }
        
        
    }
    
    @IBAction func lampRemoveAction(_ sender: Any) {
        
        let alert = UIAlertController.init(title:"테이블", message:"램프를 제거합니다.", preferredStyle: .alert)
        
        let action = UIAlertAction.init(title:"확인", style: .default,handler:{
            action in self.lampImageView.image = UIImage.init(named:"lamp-remove")
        })
        let cancelAction = UIAlertAction(title:"아니오", style: .default, handler: nil)
        alert.addAction(action)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}

