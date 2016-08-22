//
//  ViewController.swift
//  Orc-vs-Solider
//
//  Created by Phu Nguyen on 8/14/16.
//  Copyright © 2016 Phu Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var OrcImg: UIImageView!
    
    
    @IBOutlet weak var KnightImg: UIImageView!
    
    
    @IBOutlet weak var OrcHp: UILabel!
    
    @IBOutlet weak var KnightHp: UILabel!


    @IBOutlet weak var OrcAttackBtn: UIButton!
    
    
    @IBOutlet weak var KnightAttackBtn: UIButton!
    
    
    @IBOutlet weak var statusMessage: UILabel!
    
    var playerOrc: Player!
    var playerKnight: Player!
    var bgSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOrc = Player(name: "Orc", hp: 210, attackPwr: 20)
        playerKnight = Player(name:"Knight", hp: 210, attackPwr: 30)
        OrcHp.text = "\(playerOrc.hp)HP"
        KnightHp.text = "\(playerKnight.hp)HP"
        
        let path = NSBundle.mainBundle().pathForResource("TheFightMusic", ofType: "mp3")
        let soundUrl = NSURL(fileURLWithPath: path!)
        do {
            try bgSound = AVAudioPlayer(contentsOfURL: soundUrl)
            bgSound.prepareToPlay()
        }
        catch let err as NSError {
            print(err.debugDescription)
        }
        gameInit()
    }
    func gameInit() {
        
        OrcAttackBtn.hidden = true
        OrcAttackBtn.enabled = true
        OrcHp.hidden = true
        
        KnightAttackBtn.hidden = true
        KnightAttackBtn.enabled = true
        KnightHp.hidden = true
        
        statusMessage.hidden = true
        
    }
    func gameStart() {
        bgSound.volume = 0.5
        bgSound.play()
        OrcAttackBtn.hidden = false
        OrcHp.hidden = false
        KnightAttackBtn.hidden = false
        KnightHp.hidden = false
        statusMessage.hidden = false
        statusMessage.text = "Ready...Attack"
        resetBtn.hidden = true
    }
    
    @IBAction func resetBtn(sender: AnyObject) {
        gameStart()
    }
    func disableAttackBtn () {
        OrcAttackBtn.enabled = false
        KnightAttackBtn.enabled = false
    }
    
    @IBAction func OrcAttackBtn_Tapped(sender: AnyObject) {
        disableAttackBtn()
        playerKnight.attemptAttack(playerOrc.attackPwr)
        KnightHp.text = "\(playerKnight.hp) HP"
        statusMessage.text = "Orc attacks Knight for \(playerOrc.attackPwr)HP"
        NSTimer.scheduledTimerWithTimeInterval(2, target:self, selector: #selector(ViewController.enableAttackBtn(_:)),userInfo: "b", repeats: false)
        if !playerKnight.isAlive {
            KnightHp.text = ""
            statusMessage.text = "Knight has died, Orc wins"
            KnightImg.hidden = true
            
            
    }
        
    }
    
    @IBAction func KnightAttackBtn_Tapped(sender: AnyObject) {
        disableAttackBtn()
        playerOrc.attemptAttack(playerKnight.attackPwr)
        OrcHp.text = "\(playerOrc.hp) HP"
        statusMessage.text = "Knight attacks Orc for \(playerKnight.attackPwr)HP"
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(ViewController.enableAttackBtn(_:)), userInfo: "a", repeats: false)
        if !playerOrc.isAlive {
            OrcHp.text = ""
            statusMessage.text = " Orc has died, Knight wins"
            OrcImg.hidden = true
            
            
        }
        
        }
    
    func enableAttackBtn(timer: NSTimer) {
        let buttonToEnable = String(timer.userInfo!)
        if buttonToEnable == "a" {
            OrcAttackBtn.enabled = true
        }else{
            KnightAttackBtn.enabled = true
        }
    }
    
    }
    



