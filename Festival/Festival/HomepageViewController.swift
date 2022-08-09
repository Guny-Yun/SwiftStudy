//
//  HomepageViewController.swift
//  Festival
//
//  Created by rentalhub-16pro on 2022/08/09.
//

import UIKit
import WebKit

class HomepageViewController: UIViewController, WKNavigationDelegate {
    
    var homepageUrl:String = ""
    @IBOutlet weak var homepageView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homepageView.navigationDelegate = self
        navigate(initUrl:homepageUrl)
    }
    func navigate(initUrl:String){
        let url = URL.init(string: initUrl)
        let request = URLRequest.init(url: url!)
        homepageView.load(request)
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
