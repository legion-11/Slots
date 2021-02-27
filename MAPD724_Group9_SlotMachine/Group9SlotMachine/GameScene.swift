//
//  GameScene.swift
//  MAPD724_Assignment2
//
//  Created by vitalii and dmytro on 2021-02-13.
//  Copyright © 2021 Dmytro&Vitalii. All rights reserved.
//
//  Assignment 2 - Slot Machine App - Part 2 - Functionality
//  Version: 2.0 - Basic App Functionality
//
//  Group 9
//
//  Student Name: Dmytro Andriichuk
//  Student ID:   301132978
//  Date Started: 2021/02/13
//
//  Student Name: Vitalii Pielievin
//  Student ID:   300885108
//  Date Started: 2021/02/13
//
//  Slot Machine App UI - is a simple UI for a game of slots, where user can bet a certain amount of his funds and by pressing SPIN Button,
//  he can try to win more or hit a Jackpot.
//

import SpriteKit
import GameplayKit
import UIKit
import Firebase

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

//labels
var credlbl: SKLabelNode!
var betlbl: SKLabelNode!
var winlbl: SKLabelNode!
var jckPotlbl: SKLabelNode!

class GameScene: SKScene {
    
    lazy var functions = Functions.functions()
    
    var reel1: REEL1?
    var reel2: REEL2?
    var reel3: REEL3?
    
    var bet1: Bet1?
    var bet10: Bet10?
    var bet100: Bet100?
    var betMax: BetMax?
    var reset: Reset?
    var spin: Spin?
    var quit: Quit?
    var background: Background?
    var winnings = 0
    var playerMoney = 5000
    var jackpot = 0
    var winNumber = 0
    var playerBet = 0
    var lossNumber = 0
    var spinResult = ["", "", ""]
    var grapes = 0
    var bananas = 0
    var oranges = 0
    var cherries = 0
    var bars = 0
    var bells = 0
    var sevens = 0
    var lemons = 0
    var fruitsArray = [String]()
    var component1 = [Int]()
    var component2 = [Int]()
    var component3 = [Int]()
    var bounds: CGRect = CGRect.zero
    
    override func didMove(to view: SKView) {
        updateJackpot(0)
        
        screenWidth = frame.width
        screenHeight = frame.height
        background = Background()
        background?.size = CGSize(width: 750, height: 1334)
        background?.zPosition = 1
        
        addChild(background!)
        
        reel1 = REEL1()
        let image1 = UIImage(named: "spin")
        let texture1 = SKTexture(image: image1!)
        reel1?.texture = texture1
        reel1?.zPosition = 2
        reel1?.size = CGSize(width: 100, height: 100)
        reel1?.position = CGPoint(x: -160, y: -80 )
        addChild(reel1!)
        
        reel2 = REEL2()
        let image2 = UIImage(named: "spin")
        let texture2 = SKTexture(image: image2!)
        reel2?.texture = texture2
        reel2?.zPosition = 2
        reel2?.size = CGSize(width: 100, height: 100)
        reel2?.position = CGPoint(x: -10, y: -80 )
        addChild(reel2!)
        
        reel3 = REEL3()
        let image3 = UIImage(named: "spin")
        let texture3 = SKTexture(image: image3!)
        reel3?.texture = texture3
        reel3?.zPosition = 2
        reel3?.size = CGSize(width: 100, height: 100)
        reel3?.position = CGPoint(x: 140, y: -80 )
        addChild(reel3!)
        
        // Buttons
        bet1 = Bet1()
        let firstbetimg = UIImage(named: "betOnebtn")
        let bet1Texture = SKTexture(image: firstbetimg!)
        bet1?.texture = bet1Texture
        bet1?.zPosition = 4
        bet1?.position = CGPoint(x: -screenSize.size.width + 110, y: -screenSize.size.height / 2 - 70)
        addChild(bet1!)
        
        bet10 = Bet10()
        let secondbetimg = UIImage(named: "betTwobtn")
        let bet10Texture = SKTexture(image: secondbetimg!)
        bet10?.texture = bet10Texture
        bet10?.zPosition = 4
        bet10?.position = CGPoint(x: -screenSize.size.width + 260, y: -screenSize.size.height / 2 - 70)
        addChild(bet10!)
        
        bet100 = Bet100()
        let thirdbetimg = UIImage(named: "betThreebtn")
        let bet100Texture = SKTexture(image: thirdbetimg!)
        bet100?.texture = bet100Texture
        bet100?.zPosition = 4
        bet100?.position = CGPoint(x: -screenSize.size.width + 110, y: -screenSize.size.height / 2 - 220)
        addChild(bet100!)
        
        betMax = BetMax()
        let maxbetimg = UIImage(named: "betMaxbtn")
        let betMaxTexture = SKTexture(image: maxbetimg!)
        betMax?.texture = betMaxTexture
        betMax?.zPosition = 4
        betMax?.position = CGPoint(x: -screenSize.size.width + 260, y: -screenSize.size.height / 2 - 220)
        addChild(betMax!)
        
        spin = Spin()
        let spinimg = UIImage(named: "spinButton")
        let spinTexture = SKTexture(image: spinimg!)
        spin?.texture = spinTexture
        spin?.zPosition = 4
        spin?.size = CGSize(width: 140, height: 120)
        spin?.position = CGPoint(x: -screenSize.size.width + 600, y: -screenSize.size.height / 2 - 70)
        addChild(spin!)
        
        quit = Quit()
        let quitimg = UIImage(named: "quitButton")
        let quitTexture = SKTexture(image: quitimg!)
        quit?.texture = quitTexture
        quit?.zPosition = 4
        quit?.size = CGSize(width: 120, height: 160)
        quit?.position = CGPoint(x: -screenSize.size.width + 687, y: screenSize.size.height / 2 + 245)
        addChild(quit!)
        
        reset = Reset()
        let resimg = UIImage(named: "resetButton")
        let resetTexture = SKTexture(image: resimg!)
        reset?.texture = resetTexture
        reset?.zPosition = 4
        reset?.size = CGSize(width: 120, height: 160)
        reset?.position = CGPoint(x: screenSize.size.width - 685, y:screenSize.size.height / 2 + 245)
        addChild(reset!)
        
    
        // Labels (Numbers)
        betlbl = (childNode(withName: "bet") as! SKLabelNode)
        betlbl?.position = CGPoint(x: -screenSize.size.width + 400, y: -screenSize.size.height / 2 + 430)
        betlbl?.zPosition = 3
        betlbl?.fontName = "Futura-Bold"
        betlbl?.fontColor = UIColor.green
        betlbl?.fontSize = 40.00
        
        credlbl = (childNode(withName: "credits") as! SKLabelNode)
        credlbl?.position = CGPoint(x: -screenSize.size.width + 175, y: -screenSize.size.height / 2 + 625)
        credlbl?.zPosition = 2
        credlbl?.fontName = "Futura-Bold"
        credlbl?.fontColor = UIColor.black
        credlbl?.fontSize = 50.00
        
        winlbl = (childNode(withName: "winnings") as! SKLabelNode)
        winlbl?.position = CGPoint(x: -screenSize.size.width + 555, y: -screenSize.size.height / 2 + 625)
        winlbl?.zPosition = 2
        winlbl?.fontName = "Futura-Bold"
        winlbl?.fontColor = UIColor.black
        winlbl?.fontSize = 50.00
        
        jckPotlbl = (childNode(withName: "jackPot") as! SKLabelNode)
        jckPotlbl?.position = CGPoint(x: 0, y: screenSize.size.height / 2 + 190)
        jckPotlbl?.zPosition = 2
        jckPotlbl?.fontName = "Futura-Bold"
        jckPotlbl?.fontColor = UIColor.black
        jckPotlbl?.fontSize = 60.00
        //Reel array
        fruitsArray = ["lemons","grapes","banana","orange","cherry","bar","bell","seven"]
        
        for i in 0..<8 {
            component1.append(i)
            component2.append(i)
            component3.append(i)
        }
        //Show player stats in labels
    }
    
    // Different Labels
    func showPlayerStats()
    {
        betlbl?.text = String(playerBet)
        
        jckPotlbl?.text = "\(jackpot)"
        
        credlbl?.text = "\(playerMoney)"
        winlbl?.text = "\(winNumber)"
    }
    
    // Resets Reels
    func resetFruitReels() {
        grapes = 0
        bananas = 0
        oranges = 0
        cherries = 0
        bars = 0
        bells = 0
        sevens = 0
        lemons = 0
    }
    
    // Resets game to starting state
    func resetGame() {
        playerMoney = 5000
        winnings = 0
        playerBet = 0
        winNumber = 0
    }
    
    // Function compares two random numbers for the jackpot
    func jackPotValidation() {
        
        let jackPotNumber = Int(arc4random_uniform(UInt32(51))) + 1
        
        let jackPotWinNumber = Int(arc4random_uniform(UInt32(51))) + 1
        
        if jackPotNumber == jackPotWinNumber {
            updateJackpot(-jackpot)
            playerMoney += jackpot
        }
    }
    
    // Function updates PLAYER MONEY if he wins
    func showWinMessage() {
        playerMoney += winnings;
        resetFruitReels();
        jackPotValidation();
    }
    
    
    // Function updates PLAYER MONEY if he lost
    func lossParse() {
        playerMoney -= playerBet;
        resetFruitReels();
    }
    
    // Function to check values range, if within bound or not
    func checkRange(_ value: Int,_ lowerBounds: Int,_ upperBounds: Int) -> Int {
        
        if (value >= lowerBounds && value <= upperBounds)
        {
            return value
        }
        else {
            return -value
        }
    }
    
    //    This function decides winning Reels
    //    Here are probabilities of winning:
    //
    //    Lemons      - 41.5% probability of winning
    //
    //    Oranges     - 12.3% probability of winning
    //
    //    Bananas     - 13.8% probability of winning
    //
    //    Grapes      - 15.4% probability of winning
    //
    //    Bells       - 3.1% probability of winning
    //
    //    Cherries    - 7.7% probability of winning
    //
    //    Bars        - 4.6% probability of winning
    //
    //    Sevens      - 1.5% probability of winning
    
    func Reels() -> [String]{
        var winReelResults = [" ", " ", " "];
        var outCome = [0, 0, 0];
        
        for spin in 0..<3{
            outCome[spin] = Int(arc4random_uniform(UInt32(65))) + 1
            switch (outCome[spin]) {
            //Lemons 41.5% probability
            case checkRange(outCome[spin], 1, 27):
                winReelResults[spin] = fruitsArray[0]
                lemons += 1
            //Oranges 12.3% probability
            case checkRange(outCome[spin], 47, 54):
                winReelResults[spin] = fruitsArray[3]
                oranges += 1
            //Bananas 13.8% probability
            case checkRange(outCome[spin], 38, 46):
                winReelResults[spin] = fruitsArray[2]
                bananas += 1
            //Grapes 15.4% probability
            case checkRange(outCome[spin], 28, 37):
                winReelResults[spin] = fruitsArray[1]
                grapes += 1
            //Bells 3.1% probability
            case checkRange(outCome[spin], 63, 64):
                winReelResults[spin] = fruitsArray[6]
                bells += 1
            //Cherries 7.7% probability
            case checkRange(outCome[spin], 55, 59):
                winReelResults[spin] = fruitsArray[4]
                cherries += 1
            //Bars 4.6% probability
            case checkRange(outCome[spin], 60, 62):
                winReelResults[spin] = fruitsArray[5]
                bars += 1
            //Sevens 1.5% probability
            case checkRange(outCome[spin], 65, 65):
                winReelResults[spin] = fruitsArray[7]
                sevens += 1
            default:
                continue
            }
        }
    
        
        return winReelResults
    }
    
    // Function to determine which fruits/bars/bells/sevens are the winning ones
    // basic else if statement
    func determineWinnings()
    {
        if (lemons == 0)
        {
            if (grapes == 3) {
                winnings = playerBet * 10;
            }
            else if(bananas == 3) {
                winnings = playerBet * 20;
            }
            else if (oranges == 3) {
                winnings = playerBet * 30;
            }
            else if (cherries == 3) {
                winnings = playerBet * 40;
            }
            else if (bars == 3) {
                winnings = playerBet * 50;
            }
            else if (bells == 3) {
                winnings = playerBet * 75;
            }
            else if (sevens == 3) {
                winnings = playerBet * 100;
            }
            else if (grapes == 2) {
                winnings = playerBet * 2;
            }
            else if (bananas == 2) {
                winnings = playerBet * 2;
            }
            else if (oranges == 2) {
                winnings = playerBet * 3;
            }
            else if (cherries == 2) {
                winnings = playerBet * 4;
            }
            else if (bars == 2) {
                winnings = playerBet * 5;
            }
            else if (bells == 2) {
                winnings = playerBet * 10;
            }
            else if (sevens == 2) {
                winnings = playerBet * 20;
            }
            else if (sevens == 1) {
                winnings = playerBet * 5;
            }
            else {
                winnings = playerBet * 1;
            }
            winNumber += 1
            updateJackpot(-winnings)
        }
        else
        {
            lossNumber += 1
            lossParse()
            updateJackpot(playerBet)
        }
    }
    
       // Set betOne (1)
       func bet1_func() {
           playerBet = 1
           betlbl?.text = String(playerBet)
       }
       // Set betTwo (10)
       func bet10_func() {
      
           playerBet = 10
           betlbl?.text = String(playerBet)
       }
       // Set betThree (100)
       func bet100_func() {
           playerBet = 100
           //lblBet.text = String(playerBet)
           betlbl?.text = String(playerBet)
       }
       // Set betMax (ALL PLAYER MONEY)
       func betMax_func() {
           playerBet = playerMoney
           betlbl?.text = String(playerBet)
       }
    
       // Called by QUIT button - quits the app
       func quitGame_func() {
         exit(0)
       }
       // Called by RES button - resets the game to predetermined state
       func resetGame_func() {

           resetGame()
           showPlayerStats()
        // Reset state of SPIN button
           spin?.isHidden = false
       }
    
        // SPIN button function
        func spin_func() {
            
            playerBet = Int((betlbl?.text!)!)!
            if playerBet > 0 {

                if playerMoney == 0
                {
                    //Hide SPIN button if player has no money
                    spin?.isHidden = true
                }
                    
                else if playerBet <= playerMoney {
                    spinResult = Reels();
                    let indexOf0 = fruitsArray.firstIndex(of: spinResult[0])!
                    let indexOf1 = fruitsArray.firstIndex(of: spinResult[1])!
                    let indexOf2 = fruitsArray.firstIndex(of: spinResult[2])!
                    let image1Name = fruitsArray[indexOf0]
                    let image1 = UIImage(named: image1Name)
                    let texture1 = SKTexture(image: image1!)
                    reel1?.texture = texture1
                    let image2Name = fruitsArray[indexOf1]
                    let image2 = UIImage(named: image2Name)
                    let texture2 = SKTexture(image: image2!)
                    reel2?.texture = texture2
                    let image3Name = fruitsArray[indexOf2]
                    let image3 = UIImage(named: image3Name)
                    let texture3 = SKTexture(image: image3!)
                    reel3?.texture = texture3
                    
                    determineWinnings();
                }
            }
        }
        

        
        // Buttons Touch
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                let location = touch.location(in: self)
                
                if atPoint(location).name == "betOnebtn" {
                    bet1_func()
                }
                if atPoint(location).name == "betTwobtn" {
                    bet10_func()
                }
                if atPoint(location).name == "betThreebtn" {
                    bet100_func()
                }
                if atPoint(location).name == "betMaxbtn" {
                    betMax_func()
                }
                if atPoint(location).name == "spinButton" {
                    spin_func()
                }
                if atPoint(location).name == "resetButton" {
                    resetGame_func()
                }
                if atPoint(location).name == "quitButton" {
                    quitGame_func()
                }
            }
        }
        
    func updateJackpot(_ number: Int) {
        functions.httpsCallable("changeJackpot").call(["number": number]) { (result, error) in
            if let error = error as NSError? {
              if error.domain == FunctionsErrorDomain {
                  let code = FunctionsErrorCode(rawValue: error.code)
                  let message = error.localizedDescription
                  let details = error.userInfo[FunctionsErrorDetailsKey]
                  print(code ?? "no code", message, details ?? "error occured")
            }
            // ...
            }
            if let value = (result?.data as? [String: Int])?["result"] {
                print(value)
                self.jackpot = value
                self.showPlayerStats()
            }
        }
    }
    
    }

