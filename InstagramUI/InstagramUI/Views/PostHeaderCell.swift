//
//  PostHeaderCell.swift
//  InstagramUI
//
//  Created by Konstantinos Rizos on 02/03/2019.
//  Copyright © 2019 Konstantinos Rizos. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var followBtn: UIButton!
    
    var post: Post! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        profileImageView.image = post.createdBy.profileImage
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0
        profileImageView.layer.masksToBounds = true
        
        userNameLbl.text = post.createdBy.username
        
        followBtn.layer.borderWidth = 1.0
        followBtn.layer.cornerRadius = 2.0
        followBtn.layer.borderColor = followBtn.tintColor.cgColor
        followBtn.layer.masksToBounds = true
    }
    
}
