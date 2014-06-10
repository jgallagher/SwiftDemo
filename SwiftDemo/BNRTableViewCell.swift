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

    class func nibWithBundle(bundle: NSBundle?) -> UINib {
        return UINib(nibName: "BNRTableViewCell", bundle: bundle)
    }
}
