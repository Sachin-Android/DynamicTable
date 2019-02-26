//
//  ExpandTableViewCell.swift
//  DynamicHeight
//
//  Created by WIthYouHamesh on 26/02/19.
//  Copyright © 2019 SachinDaingade. All rights reserved.
//

import UIKit
import FoldingCell
class ExpandTableViewCell: FoldingCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func awakeFromNib() {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        super.awakeFromNib()
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
    
}
