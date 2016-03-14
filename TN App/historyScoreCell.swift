//
//  historyScoreCell.swift
//  TN App
//
//  Created by Evan Madill on 3/14/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit

class historyScoreCell {
    
    var historyScoreString: String
    var historyTimestampString: String
    var historyImage: UIImage?
    
    init(historyScoreString: String, historyTimestampString: String, historyImage: UIImage?) {
        self.historyScoreString = historyScoreString
        self.historyTimestampString = historyTimestampString
        self.historyImage = historyImage
    }
}
