//
//  TableViewCell.swift
//  Dr. Abdelrhman Arwish Clinic
//
//  Created by Abdelrhman on 6/13/19.
//  Copyright © 2019 Dr. Abdelrhman Arwish Clinic. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

   
    @IBOutlet weak var profileTitle_LBL: UILabel!
    
  
    @IBOutlet weak var profileDetail_LBL: UILabel!
    @IBOutlet weak var profile_Pic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
