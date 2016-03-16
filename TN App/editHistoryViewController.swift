//
//  editHistoryViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/16/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit

class editHistoryViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var datetimeLabel: UILabel!
    @IBOutlet weak var painScoreImage: UIImageView!
    @IBOutlet weak var painScoreImageBackgroundLabel: UILabel!
    @IBOutlet weak var painScoreBackgroundLabel: UILabel!
    @IBOutlet weak var painScoreLabel: UILabel!
    @IBOutlet weak var painNotes: UITextView!
    
    var painscorestringtemp: String = ""
    var datetimestringtemp: String = ""
    
    var labelsToBeStyled = [UILabel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        labelsToBeStyled.append(datetimeLabel)
        labelsToBeStyled.append(painScoreBackgroundLabel)
        labelsToBeStyled.append(painScoreImageBackgroundLabel)
        
        for label in labelsToBeStyled {
            label.layer.cornerRadius = 5.0
            label.clipsToBounds = true
        }
        painScoreImage.layer.cornerRadius = 5.0
        painScoreImage.clipsToBounds = true
        painNotes.layer.cornerRadius = 5.0
        painNotes.clipsToBounds = true
        
        // Set displayed data equal to temp variables passed in segue
        painScoreLabel.text = painscorestringtemp
        datetimeLabel.text = datetimestringtemp
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
