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
    
    // Fetch last entry ID in core data
    // Hacky solution, but need until DB gets set
    var lastEntryID: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navbar title
        self.navigationItem.title = "WritTN"
        
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
    
    // Get last entry ID
    // Hacky solution -- delete once DB is created
    func fetchLastEntryID() {
        let appDelegate_CD = UIApplication.sharedApplication().delegate as! AppDelegate
        let context_CD = appDelegate_CD.managedObjectContext
        
        let request_CD = NSFetchRequest(entityName: "PainHistory")
        // Get only the last entry
        let timestampSort = NSSortDescriptor(key: "timestamp_CD", ascending: false)
        request_CD.sortDescriptors = [timestampSort]
        request_CD.fetchLimit = 1

        do {
            let lastEntryQuery = try context_CD.executeFetchRequest(request_CD) as! [NSManagedObject]
            if lastEntryQuery.count > 0 {
                print(lastEntryQuery[0].valueForKey("entryID_CD")!)
                print(lastEntryQuery[0].valueForKey("timestamp_CD")!)
                lastEntryID = lastEntryQuery[0].valueForKey("entryID_CD") as! Int
            } else {
                lastEntryID = 0
            }
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }

    // Function to add pain score to core data
    func logPainScore() {
        // Get data on last entry ID
        fetchLastEntryID()
        
        let appDelegate_CD = UIApplication.sharedApplication().delegate as! AppDelegate
        let context_CD = appDelegate_CD.managedObjectContext
        
        let entity_CD = NSEntityDescription.entityForName("PainHistory", inManagedObjectContext: context_CD)
        let painEntry_CD = NSManagedObject(entity: entity_CD!, insertIntoManagedObjectContext: context_CD)
        
        // Create timestamp
        // Timestamp will be a string to get proper output and for simplicity
        // Create dateFormatter to achieve this
        let datetime = NSDate()
        let timestampFormatter = NSDateFormatter()
        timestampFormatter.dateFormat = "MMMM dd, yyyy -- h:mm a"
        let timestamp = timestampFormatter.stringFromDate(datetime)
        
        if switch1Label.on == true {
            painEntry_CD.setValue(true, forKey: "earPain_CD")
        } else {
            painEntry_CD.setValue(false, forKey: "earPain_CD")
        }
        if switch2Label.on == true {
            painEntry_CD.setValue(true, forKey: "cheekPain_CD")
        } else {
            painEntry_CD.setValue(false, forKey: "cheekPain_CD")
        }
        if switch3Label.on == true {
            painEntry_CD.setValue(true, forKey: "jawPain_CD")
        } else {
            painEntry_CD.setValue(false, forKey: "jawPain_CD")
        }
        
        painEntry_CD.setValue(recordedPainScore, forKey: "painScore_CD")
        painEntry_CD.setValue(timestamp, forKey: "timestamp_CD")
        // Hacky auto-increment of entry ID
        var newEntryID = lastEntryID + 1
        painEntry_CD.setValue(newEntryID, forKey: "entryID_CD")
        
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
        // fetchLastEntryID()
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
