//
//  ViewController.swift
//  Alert
//
//  Created by rentalhub-16pro on 2022/07/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let alert = UIAlertController.init(title: "타이틀", message: "메시지", preferredStyle: .alert)
        
        let action = UIAlertAction.init(title: "확인", style: .default, handler: {action -> () in
            print("확인버튼 눌렸음")
        })
        
        alert.addAction(action)
        
        
//        present(alert, animated: true, completion: nil)
        present(alert, animated: true) {
            print("메시지 창이 떴네 ㅎㅎ")
        }
    }
}

