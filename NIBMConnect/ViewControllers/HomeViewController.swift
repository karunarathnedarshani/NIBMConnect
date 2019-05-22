//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import UIKit
import LocalAuthentication
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func authenticateUser() {
        let myContext = LAContext()
        let myLocalizedReasonString = "NiBM Connect Need Biometrics to Proceed"
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            self.performSegue(withIdentifier: "goToProfile", sender: self)
                            
                        } else {
                            
                            let err = evaluateError?.localizedDescription
                            print(err)
                        }
                    }
                }
            } else {
                print("Sorry!!.. Could not evaluate policy.")
            }
        } else {
            print("Sorry!!.. Could not evaluate policy.")
        }
    }
    
    
    func signOut()  {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.performSegue(withIdentifier: "logoutSegue", sender: self)
            }

        } catch let signOutError as NSError {
            print(signOutError.localizedDescription)
        }
    }
    
    
    
    
    @IBAction func profileViewTap(_ sender: Any) {
        
        authenticateUser()
    }
    
    @IBAction func logOut(_ sender: Any) {
        signOut()
    }
    
    
    
}
