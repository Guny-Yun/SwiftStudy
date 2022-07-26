//
//  Page3ViewController.swift
//  Navigation
//
//  Created by rentalhub-16pro on 2022/07/25.
//

import UIKit

class Page3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goPage4Action(_ sender: Any) {
        
        let page4VC = storyboard?.instantiateViewController(withIdentifier: "Page4ViewController")
        navigationController?.pushViewController(page4VC!, animated: true)
        
    }
    
    @IBAction func showPage5Action(_ sender: Any) {
        let page4VC = storyboard?.instantiateViewController(withIdentifier: "Page4ViewController")
        page4VC?.modalPresentationStyle = .fullScreen
        page4VC?.modalTransitionStyle = .partialCurl
        present(page4VC!,animated: true)
        
        
    
    }
    
    @IBAction func goAnyAction(_ sender: Any) {
        let controllers = self.navigationController?.viewControllers
        for vc in controllers! {
            if vc is ViewController {
                        _ = self.navigationController?.popToViewController(vc as! ViewController, animated: true)
            }
        }
        
        
        if let vc = navigationController?.viewControllers[1]{
            navigationController?.popToViewController(vc, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
