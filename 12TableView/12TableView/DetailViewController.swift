//
//  DetailViewController.swift
//  12TableView
//
//  Created by rentalhub-16pro on 2022/07/25.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var todoImageView: UIImageView!
    
    var imageName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        todoImageView.image = UIImage(named: imageName)

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
