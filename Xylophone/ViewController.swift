//
//  ViewController.swift
//  Xylophone
//
//  Created by Sarah Alsharif on 3/15/20.
//  Copyright © 2020 Raqmia. All rights reserved.
//

import UIKit
//interact with hardware Audio/Vision
import AVFoundation

class ViewController: UIViewController {

    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.alpha = 0.8
        playSound(sender.titleLabel?.text)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            sender.alpha = 1.0
        }
        
    }
    
    func playSound(_ buttonTitle : String?) {
        let resource = "Sounds/" + buttonTitle!
        guard let url = Bundle.main.url(forResource: resource, withExtension: "wav") else  { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

