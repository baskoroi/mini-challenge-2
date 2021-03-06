//
//  SceneDelegate.swift
//  MC2-Elder
//
//  Created by Angela Fanuela on 23/05/20.
//  Copyright © 2020 Angela Fanuela. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // choose to view onboarding view controller as first try or not
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstTime") == nil {
            /*
            sorry I have to comment this line below so that we don't have to delete the app
            everytime before we login as elder or helper
            */
            //defaults.set("no", forKey: "isFirstTime") // set to non-nil value
            defaults.set("", forKey : "userType")
            let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
            let viewController = storyboard.instantiateViewController(
                withIdentifier: "Onboarding") as! OnboardingViewController
            self.window?.rootViewController = viewController
            self.window?.makeKeyAndVisible()
        }
        else {
            // choose which page to go as elder or helper
           if defaults.string(forKey: "userType") == "Elder"  {
                let storyboard = UIStoryboard(name: "Home", bundle: nil)
                let viewController = storyboard.instantiateViewController(
                    withIdentifier: "Home") as! HomeElderVC
                self.window?.rootViewController = viewController
                self.window?.makeKeyAndVisible()
            }
            else if defaults.string(forKey: "userType") == "Helper" {
                let storyboard = UIStoryboard(name: "Masuk", bundle: nil)
                let viewController = storyboard.instantiateViewController(
                    withIdentifier: "Masuk") as! LoginHelperVC
                self.window?.rootViewController = viewController
                self.window?.makeKeyAndVisible()
            }
        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

