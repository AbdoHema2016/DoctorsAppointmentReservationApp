//
//  IndividualPost.swift
//  Doc
//
//  Created by Abdelrhman on 12/15/17.
//  Copyright © 2017 bigNerdeo. All rights reserved.
//

import UIKit
class IndividualPostVC: UIViewController {
    
    @IBOutlet weak var postText_Lbl: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var postTitle_Lbl: UILabel!
    override func viewDidLoad() {
        postText_Lbl.text = finalText
         postTitle_Lbl.text = finalTitle
        let postPicUrl:NSURL? = NSURL(string: finalPostImage)
        if let url = postPicUrl {
            
            postImage.sd_setImage(with: url as URL )
        }
    }




}


