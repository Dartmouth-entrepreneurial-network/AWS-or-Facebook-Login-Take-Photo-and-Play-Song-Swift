//
//  AppDelegate.swift
//  Matchup
//
//  Created by Randall Reynolds on 2/27/16.
//  Copyright © 2016 Randall Andrew Sam Sam. All rights reserved.
//
import AWSCore
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //AWS default service configuration
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType: AWSRegionType.USEast1, identityPoolId: "us-east-1:8ba306b8-9edb-441b-881b-3be159e82a44")
        //other parameters that may be added into AWSCognitoCredentialsProvider
        //accountId: "098342329016"
        //unauthRoleArn: "arn:aws:iam::098342329016:role/Cognito_MatchupUnauth_Role", authRoleArn: "arn:aws:iam:098342329016:role/Cognito_MatchupAuth_Role"
        
        let defaultServiceConfiguration = AWSServiceConfiguration(
            region: AWSRegionType.USEast1, credentialsProvider: credentialsProvider)
        
        AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = defaultServiceConfiguration
        
        // Initialize the Cognito Sync client
        let syncClient = AWSCognito.defaultCognito()
        
        // Create a record in a dataset and synchronize with the server
        let dataset = syncClient.openOrCreateDataset("myDataset3")
        dataset.setString("password", forKey:"email")
        dataset.synchronize().continueWithBlock {(task: AWSTask!) -> AnyObject! in
            // Your handler code here
            return nil
            
        }
    
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

