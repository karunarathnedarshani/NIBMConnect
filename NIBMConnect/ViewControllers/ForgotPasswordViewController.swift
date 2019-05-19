//
//  ForgotPasswordViewController.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {

    
    
    @IBOutlet weak var emailTxtF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //functions
    
    func retriveNewPassword(userName:String){
        
        Auth.auth().sendPasswordReset(withEmail: userName) { (error) in
            if (error != nil){
                
                print("Error")
                self.displayalert(title: "Error", message: error!.localizedDescription)
            }else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.dismiss(animated: true, completion: nil)
                })
            }
        }
    }
    
    //UI Actions
    
    @IBAction func dismissController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func submit(_ sender: Any) {
        
        let newString:String = emailTxtF.text!
        let trimmedString  = newString.trim()
        
        if emailTxtF.text!.isEmpty {
            self.displayalert(title: "Error", message: "Please fill neccessary fields")
            
        }else if !(isValidEmail(testStr: trimmedString)){
            self.displayalert(title: "Error", message: "Please provide a valid email")
        } else{
            retriveNewPassword(userName: emailTxtF.text!)
        }
    }
    
}
