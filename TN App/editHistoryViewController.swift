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
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var datetimeLabel: UILabel!
    @IBOutlet weak var painScoreImage: UIImageView!
    @IBOutlet weak var painScoreImageBackgroundLabel: UILabel!
    @IBOutlet weak var painScoreBackgroundLabel: UILabel!
    @IBOutlet weak var painScoreLabel: UILabel!
    @IBOutlet weak var painNotes: UITextView!
    @IBOutlet weak var adjustPainScoreStyle: UIStepper!
    
    var painscorestringtemp: String = ""
    var datetimestringtemp: String = ""
    var adjustpainscoreinitialvalue: Double = 0
    
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
        
        // Set boundaries on incrementer
        adjustPainScoreStyle.wraps = true
        adjustPainScoreStyle.maximumValue = 10
        adjustPainScoreStyle.minimumValue = 0
        adjustPainScoreStyle.value = adjustpainscoreinitialvalue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func adjustPainScore(sender: UIStepper) {
        painScoreLabel.text = "Pain: \(Int(sender.value))"
    }
    
    // Dismiss view with cancel button
    @IBAction func cancelButtonAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            
        }
    }
    

}
