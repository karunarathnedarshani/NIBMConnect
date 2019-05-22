//
//  HomeWorkCell.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import UIKit

class HomeWorkCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var desLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupLayout(title:String, des:String){
        
        self.titleLbl.text = title
        self.desLbl.text = des
    }

}
