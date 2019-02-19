//
//  ListCell.swift
//  DynamicHeight
//
//  Created by WIthYouHamesh on 19/02/19.
//  Copyright © 2019 SachinDaingade. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var lblTitle: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
