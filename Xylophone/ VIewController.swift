//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer : AVAudioPlayer!
    let soundArray = ["note1","note2","note3","note4","note5","note6","note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        let selectedSoundFile: String = soundArray[Int(sender.tag)-1]
        playSound(selectedSoundFile)
        
    }
    
    func playSound(_ selectedSoundFile: String) {
        let soundToPlay = Bundle.main.url(forResource: selectedSoundFile, withExtension: "wav")!
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try audioPlayer = AVAudioPlayer(contentsOf: soundToPlay)
            
        } catch {
            print(error)
        }
        audioPlayer.play()
    }
  

}

