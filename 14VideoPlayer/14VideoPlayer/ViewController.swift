//
//  ViewController.swift
//  14VideoPlayer
//
//  Created by rentalhub-16pro on 2022/07/26.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoPlayer = AVPlayerViewController.init()
        
    }

    @IBAction func localVideoAction(_ sender: Any) {
        let path = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = URL.init(fileURLWithPath: path!)
        videoPlayer.player = AVPlayer.init(url: url)
        present(videoPlayer, animated: true) {
            self.videoPlayer.player?.play()
        }
        
    }
    
    @IBAction func externalVideoAction(_ sender: Any) {
        let url = URL.init(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fileworks.mp4")!
        videoPlayer.player = AVPlayer.init(url: url)
        present(videoPlayer, animated: true) {
            self.videoPlayer.player?.play()
        }
    }
}

