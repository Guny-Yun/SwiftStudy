//
//  ViewController.swift
//  13MediaPlayer
//
//  Created by rentalhub-16pro on 2022/07/26.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var playTimeLabel: UILabel!
    @IBOutlet weak var leftTimeLabel: UILabel!
    @IBOutlet weak var recordTimeLabel: UILabel!
    
    var audioPlayer: AVAudioPlayer!
    var audioTimer : Timer?
    
    var recorder: AVAudioRecorder!
    var recordTimer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAudio()
        initRecorder()
        
    }
    
    func initAudio(){
        let path = Bundle.main.path(forResource: "Sicilian_Breeze", ofType: "mp3")
        let url = URL.init(fileURLWithPath: path!)
        audioPlayer = try! AVAudioPlayer.init(contentsOf: url)
    }
    
    func initRecorder(){
        let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = docUrl.appendingPathComponent("record.m4a")
        print(fileUrl)
        let settings: [String:Any] = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100
        ]
        recorder = try! AVAudioRecorder.init(url: fileUrl, settings:settings )
        
    }
    
    
    @IBAction func playButtonAction(_ sender: Any) {
        audioPlayer.play()
        
        audioTimer?.invalidate()
        
        audioTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.updatePlayInfo()
        }
        
    }
    
    // 진행 시간 표시
    func updatePlayInfo(){
        progressView.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
        
        playTimeLabel.text = timeIntervalToAudioFormatString(time: audioPlayer.currentTime)
        
        leftTimeLabel.text = timeIntervalToAudioFormatString(time: audioPlayer.duration - audioPlayer.currentTime)
    }
    
    // 시간 구해서 format 맞게 리턴
    func timeIntervalToAudioFormatString(time: TimeInterval) -> String {
        let seconds = Int(time)
        return String.init(format: "%02d:%02d", seconds / 60, seconds % 60)
    }
    
    @IBAction func pauseButtonAction(_ sender: Any) {
        audioPlayer.pause()
        audioTimer?.invalidate()
        
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        audioPlayer.stop()
        audioTimer?.invalidate()
        
    }
    
    @IBAction func volumeChanged(_ sender: UISlider) {
        audioPlayer.volume = sender.value
        
    }
    
    @IBAction func recordOnOffChanged(_ sender: UISwitch) {
        recorder.stop()
        
        
    }
    @IBAction func recordAction(_ sender: Any) {
        recorder.record()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.updateRecordInfo()
        }
        
    }
    
    func updateRecordInfo(){
        recordTimeLabel.text = timeIntervalToAudioFormatString(time: recorder.currentTime)
    }
    
}

