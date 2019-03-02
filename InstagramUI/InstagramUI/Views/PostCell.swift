//
//  PostCell.swift
//  InstagramUI
//
//  Created by Konstantinos Rizos on 02/03/2019.
//  Copyright © 2019 Konstantinos Rizos. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var numberOfLikesBtn: UIButton!
    @IBOutlet weak var postCaptionLbl: UILabel!
    @IBOutlet weak var timeAgoLbl: UILabel!
    @IBOutlet weak var shareThisBtn: UIButton!
    

    var post: Post! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        self.postImageView.image = post.image
        postCaptionLbl.text = post.caption
        numberOfLikesBtn.setTitle("🖤 \(post.numberOfLikes!) Likes", for: [])
        shareThisBtn.setTitle("Be the first one to share a comment", for: [])
        timeAgoLbl.text = post.timeAgo
    }
}
