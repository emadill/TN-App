//
//  painScoreTableViewCell.swift
//  TN App
//
//  Created by Evan Madill on 3/11/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit

class painScoreTableViewCell: UITableViewCell {
    // MARK: Properties
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
