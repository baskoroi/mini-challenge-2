//
//  HomeElderVC.swift
//  MC2-Group15
//
//  Created by Grace Cindy on 28/05/20.
//  Copyright © 2020 Angela Fanuela. All rights reserved.
//

import UIKit

class HomeElderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setAsElder()
    }
    

    func setAsElder(){
        //UserDefaults.standard.set("no", forKey: "isFirstTime") // set to non-nil value
        
        var usertype = UserDefaults.standard.string(forKey: "userType")
        print("Previously Logged In as : \(usertype)")
        UserDefaults.standard.set("Elder", forKey : "userType")
        usertype = UserDefaults.standard.string(forKey: "userType")
        print("Set Log In as : \(usertype)")
    }

}
