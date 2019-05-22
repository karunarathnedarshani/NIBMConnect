//
//  AddHomeWorkViewController.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import UIKit

class AddHomeWorkViewController: UIViewController {

    @IBOutlet weak var titleTxtF: UITextField!
    @IBOutlet weak var desTxtF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Functions
    
    func addHomeWork()  {
        if titleTxtF.text!.isEmpty || desTxtF.text!.isEmpty {
            self.displayalert(title: "Error", message: "Please fill in all fields")
            
        }else{
            
            let newHomeWork = HomeWork(title: titleTxtF.text!, des: desTxtF.text!)
            HomeWork.saveHomeWork(homeWork: newHomeWork)
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func saveHomeWork(_ sender: Any) {
        
        addHomeWork()
    }
    
}
