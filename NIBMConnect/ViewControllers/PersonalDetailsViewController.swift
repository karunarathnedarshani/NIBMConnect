//
//  PersonalDetailsViewController.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import UIKit
import Kingfisher

class PersonalDetailsViewController: UIViewController {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lname: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var fname: UILabel!
    @IBOutlet weak var facebook: UILabel!
    
    var friendObject:Friend! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let img = URL(string: friendObject.imgString)
        profileImg.kf.setImage(with: img)
        fname.text = friendObject.fName
        lname.text = friendObject.lName
        city.text = friendObject.city
        birthday.text = friendObject.birhday
        facebook.text = friendObject.fbUrl
        phone.text = friendObject.phoneNum
        
    }
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  
    
    
    

}
