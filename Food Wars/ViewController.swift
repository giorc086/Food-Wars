//
//  ViewController.swift
//  Food Wars
//
//  Created by Cecilia Giorcelli on 5/16/16.
//  Copyright © 2016 Cecilia Giorcelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TopBtn: UIButton!
    @IBOutlet weak var BtmBtn: UIButton!
    
    @IBOutlet weak var GrnLabel: UILabel!
    
    @IBOutlet weak var endScene: UILabel!
    
    @IBOutlet weak var TopEndLbl: UILabel!
    @IBOutlet weak var BtmEndLbl: UILabel!
    @IBOutlet weak var RedLabel: UILabel!
    @IBOutlet weak var NewGameBtn: UIButton!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        score = 0
        GrnLabel.text = "\(score)"
        RedLabel.text = "\(score)"
        
        GrnLabel.transform = CGAffineTransformMakeRotation(3.14)//rotate upside down for other player
        
        //hides end label and 'new game' button until someone loses/wins
            endScene.hidden = true
            TopEndLbl.hidden = true
            BtmEndLbl.hidden = true
            NewGameBtn.hidden = true
        
        TopEndLbl.transform = CGAffineTransformMakeRotation(3.14)//rotate upside down for other player
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GrnBtnAction(sender: AnyObject) {
        score+=1
        GrnLabel.text = "\(score)"
        RedLabel.text = "\(score)"
        testScore()
    }

    @IBAction func RedBtnAction(sender: AnyObject) {
    score-=1
    GrnLabel.text = "\(score)"
    RedLabel.text = "\(score)"
        
    testScore()
    }
    
    func testScore(){
        if score >= 10 {
            //show end screen if 10 is reached
            endScene.hidden = false
            TopEndLbl.hidden = false
            BtmEndLbl.hidden = false
            NewGameBtn.hidden = false
            
            //display loser and winner text
            TopEndLbl.text = "🐮 Wins"
            BtmEndLbl.text = "🐯 Loses"
            
        }else if score <= -10{
            //show end screen if -10 is reached
           endScene.hidden = false
            TopEndLbl.hidden = false
            BtmEndLbl.hidden = false
            NewGameBtn.hidden = false
            
            //display loser and winner text
            TopEndLbl.text = "🐮 Loses"
            BtmEndLbl.text = "🐯 Wins"
            
        }
    }
    @IBAction func NewGameBtn(sender: AnyObject) {
        //when end screen is tapped, hide end screen and re-start game at 0
        endScene.hidden = true
        TopEndLbl.hidden = true
        BtmEndLbl.hidden = true
        NewGameBtn.hidden = true
        
        //start new game at 0
        score = 0
        GrnLabel.text = "\(score)"
        RedLabel.text = "\(score)"
    }
}

