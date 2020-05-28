//
//  OnboardingViewController.swift
//  MC2-Group15
//
//  Created by Baskoro Indrayana on 05/27/20.
//  Copyright © 2020 Angela Fanuela. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

   override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        validateUserDefaults()
    }
    

    
    // add action
    // validate from User Defaults, redirect to Helper Login Page
    
    func validateUserDefaults(){
        let usertype = UserDefaults.standard.string(forKey: "userType")
        print("Previously Logged In as : \(usertype)")
    }

}
