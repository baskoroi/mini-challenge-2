//
//  LoginHelperVC.swift
//  MC2-Group15
//
//  Created by Grace Cindy on 28/05/20.
//  Copyright © 2020 Angela Fanuela. All rights reserved.
//

import UIKit

class LoginHelperVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func actionLogin(_ sender: UIButton) {
        //UserDefaults.standard.set("no", forKey: "isFirstTime") // set to non-nil value
        
        var usertype = UserDefaults.standard.string(forKey: "userType")
        print("Previously Logged In as : \(usertype)")
        UserDefaults.standard.set("Helper", forKey : "userType")
        usertype = UserDefaults.standard.string(forKey: "userType")
        print("Set Log In as : \(usertype)")
    }
    

}
