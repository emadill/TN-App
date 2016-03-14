//
//  historyTableViewCell.swift
//  TN App
//
//  Created by Evan Madill on 3/14/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit

class historyTableViewCell: UITableViewCell {
    // MARK: Properties
    
    @IBOutlet weak var historyScoreLabel: UILabel!
    @IBOutlet weak var historyTimestampLabel: UILabel!
    @IBOutlet weak var historyImageview: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
