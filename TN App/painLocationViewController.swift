//
//  painLocationViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/12/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit

class painLocationViewController: UIViewController {

    @IBOutlet weak var backgroundLabel: UILabel!
    @IBOutlet weak var backgroundLabelZone1: UILabel!
    @IBOutlet weak var backgroundLabelZone2: UILabel!
    @IBOutlet weak var backgroundLabelZone3: UILabel!
    @IBOutlet weak var painLocationImage: UIImageView!
    @IBOutlet weak var zone1Label: UILabel!
    @IBOutlet weak var zone2Label: UILabel!
    @IBOutlet weak var zone3Label: UILabel!
    @IBOutlet weak var switch1Label: UISwitch!
    @IBOutlet weak var switch2Label: UISwitch!
    @IBOutlet weak var switch3Label: UISwitch!
    
    var labelsToBeStyled = [UILabel]()
    var backgroundLabelsToBeStyled = [UILabel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navbar title
        self.navigationItem.title = "Location"

        labelsToBeStyled.append(zone1Label)
        labelsToBeStyled.append(zone2Label)
        labelsToBeStyled.append(zone3Label)
        
        backgroundLabelsToBeStyled.append(backgroundLabel)
        backgroundLabelsToBeStyled.append(backgroundLabelZone1)
        backgroundLabelsToBeStyled.append(backgroundLabelZone2)
        backgroundLabelsToBeStyled.append(backgroundLabelZone3)
        
        for label in labelsToBeStyled {
            label.layer.cornerRadius = 10.0
            label.clipsToBounds = true
        }
        for label in backgroundLabelsToBeStyled {
            label.layer.cornerRadius = 5.0
            label.clipsToBounds = true
        }
        painLocationImage.layer.cornerRadius = 5.0
        painLocationImage.clipsToBounds = true

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
