//
//  PlaySoundViewController.swift
//  Pitch_Perfect_project
//
//  Created by Donghee Lee on 8/25/16.
//  Copyright © 2016 jacob_lee. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var parrotButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum BottonType: Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb}
    
    @IBAction func playSoundForButton (sender: UIButton) {
        print("play sound button was pressed")
        switch(BottonType(rawValue: sender.tag)!) {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(rate: -20)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        configureUI(.Playing)
    }

    @IBAction func stopButtonPressed (sender: AnyObject){
        print("Stop Button was pressed")
        stopAudio()
    }
    
    var recordedAudio: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlaySoundViewController loaded")
        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
