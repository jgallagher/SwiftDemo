//
//  BNRTableViewCell.swift
//  SwiftDemo
//
//  Created by Matthew D. Mathias on 6/8/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

import UIKit

class BNRTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel
    @IBOutlet var ageLabel: UILabel

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
