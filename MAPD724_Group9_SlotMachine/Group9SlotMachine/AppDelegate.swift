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

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       // sleep(1)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

