//
//  ViewController.swift
//  PageControlWithScroll
//
//  Created by rentalhub-16pro on 2022/07/18.
//

import UIKit

class SlidingViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let scrollView = UIScrollView.init(frame: view.frame)
        //view.addSubview(scrollView)
        view.insertSubview(scrollView, at: 0)
        
        let w = view.frame.width
        let h = view.frame.height
        
        scrollView.contentSize = CGSize(width: w * 6, height: h)
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .black
        
        for i in 0...5{
            let image = UIImage(named: String(format: "%02d", i + 1))
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: CGFloat(i) * w, y: 0,width: w,height: h)
            scrollView.addSubview(imageView)
        }
        
        pageControl.numberOfPages = 6
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        pageControl.currentPage = Int(scrollView.contentOffset.x / view.frame.width)
    }

}

