//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by Mir Ahmed on 7/6/17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import UIKit

class PostHeaderCell: UITableViewCell {
    static let height: CGFloat = 54
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func optionsButtonTapped(_ sender: UIButton) {
        print("options button tapped")
    }
}
