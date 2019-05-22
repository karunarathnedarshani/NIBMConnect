//
//  FriendTableViewCell.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import UIKit
import Kingfisher

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupLayout(firstName:String, lastName:String, city:String, profile:String) {
        
        let img = URL(string: profile)
        self.fullNameLbl.text = "\(firstName)  \(lastName)"
        self.cityLbl.text = city
        
        self.profileImageView.kf.setImage(with: img)
    }

}
