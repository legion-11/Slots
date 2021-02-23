//
//  GameViewController.swift
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

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
        }
    }
    // Hide iOS status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
