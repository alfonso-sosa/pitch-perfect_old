//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Alfonso Sosa on 16/03/15.
//  Copyright (c) 2015 Alfonso Sosa. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    var receivedAudio: RecordedAudio!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathURL, error: nil)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathURL, error: nil)
        audioPlayer.enableRate = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playSound(rate: Float){
        self.stop()
        
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playSnailSound(sender: UIButton) {
        playSound(0.5)
    }

    @IBAction func playRabbitSound(sender: UIButton) {
        playSound(2.0)
    }
    
    
    func playAudioWithVariablePitch(pitch: Float){
        self.stop()
        
        var playerNode = AVAudioPlayerNode()
        audioEngine.attachNode(playerNode)
        
        
        var auTimePitch = AVAudioUnitTimePitch()
        auTimePitch.pitch = pitch
        audioEngine.attachNode(auTimePitch)
        
        audioEngine.connect(playerNode, to: auTimePitch, format: nil)
        audioEngine.connect(auTimePitch, to: audioEngine.outputNode, format: nil)
        
        playerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        playerNode.play()
    }
    
    @IBAction func playChipmunkSound(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthVaderSound(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }

    @IBAction func stop(sender: UIButton) {
        self.stop()
    }
    
    func stop(){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }

}
