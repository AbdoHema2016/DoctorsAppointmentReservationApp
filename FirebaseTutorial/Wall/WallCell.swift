//
//  WallCell.swift
//  Doc
//
//  Created by Abdelrhman on 10/31/17.
//  Copyright © 2017 bigNerdeo. All rights reserved.
//

import UIKit
class WallCell: UITableViewCell {
    
    
    
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postPic: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
