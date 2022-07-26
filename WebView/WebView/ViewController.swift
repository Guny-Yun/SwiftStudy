//
//  ViewController.swift
//  WebView
//
//  Created by rentalhub-16pro on 2022/07/18.
//

import UIKit
import WebKit



class ViewController: UIViewController,WKNavigationDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        textField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        navigate(initUrl: textField.text!)
        
        return true
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    
    
    func navigate(initUrl:String){
        let url = URL.init(string: initUrl)
        let request = URLRequest.init(url: url!)
        webView.load(request)
    }
    
    @IBAction func site1Action(_ sender: Any) {
        navigate(initUrl: "https://www.apple.com")
    }
    
    @IBAction func site2Action(_ sender: Any) {
        navigate(initUrl: "https://www.google.com")
    }
    
    @IBAction func stopAction(_ sender: Any) {
        webView.stopLoading()
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        webView.reload()
    }
    
    
    @IBAction func rewindAction(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func fowordAction(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func loadHTML(_ sender: Any) {
        let htmlString =
        "<h1>안녕</h1><p>HTML String을 이용한 웹 페이지</p><p><a href=\"https://naver.com\">네이버로 이동</p>"
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func fileAction(_ sender: Any) {
        let path = Bundle.main.path(forResource: "htmlView", ofType: "html")!

        let url = URL.init(fileURLWithPath: path)
        let request = URLRequest(url:url)
        webView.load(request)
    }
    
    @IBAction func goBtn(_ sender: UIButton) {
        let goUrl = chkUrl(textField.text!)
        textField.text = " "
        navigate(initUrl: goUrl)
    }
    
    func chkUrl(_ url: String)->String{
        var strUrl = url
        let flag = strUrl.hasPrefix("https://")
        
        if !flag{
            strUrl = "https://" + strUrl
        }
        return strUrl
    }
}

