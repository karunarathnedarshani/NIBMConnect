//
//  LoginViewController.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTxtF: UITextField!
    @IBOutlet weak var passwordTxtF: UITextField!
    @IBOutlet weak var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Function
    
    func loginUser(userName:String, pass:String){
        Auth.auth().signIn(withEmail: userName, password: pass) { [weak self] user, error in
            guard let strongSelf = self else { return }
            
            if (error != nil){
                
                
                strongSelf.displayalert(title: "Error", message: error!.localizedDescription)
                strongSelf.loadingView.alpha = 0
                strongSelf.view.sendSubviewToBack(strongSelf.loadingView)
                
                
            }else{
                strongSelf.loadingView.alpha = 0
                strongSelf.view.sendSubviewToBack(strongSelf.loadingView)
            
                strongSelf.performSegue(withIdentifier: "goToHomeLogin", sender: self)
            }
        }
    }
    
    @IBAction func signinTap(_ sender: Any) {
        
        if (emailTxtF.text?.isEmpty)! || (passwordTxtF.text?.isEmpty)!{
            self.displayalert(title: "Error", message: "Please fill the necessary fields")
            return
            
        }else if !(isValidEmail(testStr: emailTxtF.text!)){
            
            self.displayalert(title: "Error", message: "please enter a valid email")
            return
            
        }else{
            self.loadingView.alpha = 1
            self.view.bringSubviewToFront(self.loadingView)
            loginUser(userName: emailTxtF.text!, pass: passwordTxtF.text!)
        }
    }
    
}
