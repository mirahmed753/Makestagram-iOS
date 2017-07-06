//
//  PostActionCell.swift
//  Makestagram
//
//  Created by Mir Ahmed on 7/6/17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import UIKit

class PostActionCell: UITableViewCell {
    static let height: CGFloat = 46
    
    // buttons and labels (views)
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    // cell lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // IBActions
    @IBAction func likeButtonTapped(_ sender: Any) {
        print("like button tapped")
    }
}
