//
//  painLocationViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/12/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit
import CoreData

class painLocationViewController: UIViewController {

    @IBOutlet weak var backgroundLabel: UILabel!
    @IBOutlet weak var backgroundLabelZone1: UILabel!
    @IBOutlet weak var backgroundLabelZone2: UILabel!
    @IBOutlet weak var backgroundLabelZone3: UILabel!
    @IBOutlet weak var painLocationImage: UIImageView!
    @IBOutlet weak var switch1Label: UISwitch!
    @IBOutlet weak var switch2Label: UISwitch!
    @IBOutlet weak var switch3Label: UISwitch!
    
    var labelsToBeStyled = [UILabel]()
    var backgroundLabelsToBeStyled = [UILabel]()
    var painScoreEntries_CD = [NSManagedObject]()
    
    var timestamp: NSDate = NSDate()
    var recordedPainScore: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navbar title
        self.navigationItem.title = "Location"
        
        backgroundLabelsToBeStyled.append(backgroundLabel)
        backgroundLabelsToBeStyled.append(backgroundLabelZone1)
        backgroundLabelsToBeStyled.append(backgroundLabelZone2)
        backgroundLabelsToBeStyled.append(backgroundLabelZone3)
        
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
    
    // Function to add pain score to core data
    func logPainScore() {
        let appDelegate_CD = UIApplication.sharedApplication().delegate as! AppDelegate
        let context_CD = appDelegate_CD.managedObjectContext
        
        let entity_CD = NSEntityDescription.entityForName("PainHistory", inManagedObjectContext: context_CD)
        let painEntry_CD = NSManagedObject(entity: entity_CD!, insertIntoManagedObjectContext: context_CD)
        
        // Assign values
        let timestamp = NSDate()
        painEntry_CD.setValue(recordedPainScore, forKey: "painScore_CD")
        painEntry_CD.setValue(timestamp, forKey: "timestamp_CD")
        
        // Save to core data
        do {
            try context_CD.save()
            painScoreEntries_CD.append(painEntry_CD)
            // Test saving function
            print(painScoreEntries_CD[(painScoreEntries_CD.count - 1)])
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    @IBAction func cancelButtonAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveButtonAction(sender: AnyObject) {
        logPainScore()
        dismissViewControllerAnimated(true, completion: nil)
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
