//
//  NewsFeedTableViewController.swift
//  InstagramUI
//
//  Created by Konstantinos Rizos on 02/03/2019.
//  Copyright © 2019 Konstantinos Rizos. All rights reserved.
//

import UIKit
import Toast_Swift

class NewsFeedTableViewController: UITableViewController {
    
    var posts: [Post]?
    
    struct Storyboard {
        static let postCell = "PostCell"
        static let postHeaderCell = "PostHeaderCell"
        static let postHeaderHeight: CGFloat = 57.0
        static let postCellDefaultHeight: CGFloat = 578.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchPosts()
        
        tableView.estimatedRowHeight = Storyboard.postCellDefaultHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
    }
    
    func fetchPosts() {
        self.posts = Post.fetchPosts()
        self.tableView.reloadData()
    }

    @IBAction func refresh(_ sender: UIRefreshControl) {
        sender.endRefreshing()
        tableView.reloadData()
        self.view.makeToast("The data has been reloaded", duration: 3, position: .top)
    }
}

extension NewsFeedTableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let posts = posts {
            return posts.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = posts {
            return 1
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.postCell, for: indexPath) as! PostCell
        
        cell.post = self.posts?[indexPath.section]
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.postHeaderCell) as! PostHeaderCell
        
        cell.post = self.posts?[section]
        cell.backgroundColor = UIColor.white
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Storyboard.postHeaderHeight
    }
    
}
