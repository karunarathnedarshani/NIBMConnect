//
//  LandingViewController.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TempAppData.userHandle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            
            if user != nil {
                self.performSegue(withIdentifier: "goToHome", sender: self)
            }else{
                self.performSegue(withIdentifier: "goToLogin", sender: self)
            }
        })

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
         Auth.auth().removeStateDidChangeListener(TempAppData.userHandle!)
    }
    

}
