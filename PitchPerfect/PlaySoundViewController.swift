//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Ahmed Ghazy on 7/19/17.
//  Copyright © 2017 GhazyProductions. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    @IBOutlet weak var Slow: UIButton!
    @IBOutlet weak var fast: UIButton!
    @IBOutlet weak var high: UIButton!
    @IBOutlet weak var low: UIButton!
    @IBOutlet weak var rever: UIButton!
    @IBOutlet weak var echo: UIButton!
    @IBOutlet weak var stop: UIButton!

    var recordedAudioURL: URL!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, high, low, echo, rever
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .high:
            playSound(pitch: 1000)
        case .low:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        default:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }

}
