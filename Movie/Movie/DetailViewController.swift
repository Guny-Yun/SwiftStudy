//
//  DetailViewController.swift
//  Movie
//
//  Created by rentalhub-16pro on 2022/08/02.
//

import UIKit
import WebKit


class DetailViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var prepareUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        self.webView.isOpaque = false
        self.webView!.backgroundColor = UIColor.systemBlue
        
        navigate(initUrl: prepareUrl!)
        
    }
    
    func navigate(initUrl:String){
        let url = URL.init(string: initUrl)
        let request = URLRequest.init(url: url!)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }

}
