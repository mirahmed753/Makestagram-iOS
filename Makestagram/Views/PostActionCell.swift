//
//  PostActionCell.swift
//  Makestagram
//
//  Created by Mir Ahmed on 7/6/17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import UIKit

protocol PostActionCellDelegate: class {
    func didTapLikeButton(_ likeButton: UIButton, on cell: PostActionCell)
}

class PostActionCell: UITableViewCell {
    static let height: CGFloat = 46
    
    // properties
    weak var delegate: PostActionCellDelegate?
    
    // buttons and labels (views)
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    // cell lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // IBActions
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        delegate?.didTapLikeButton(sender, on: self)
    }
    
}
