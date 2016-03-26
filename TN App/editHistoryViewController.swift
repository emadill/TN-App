//
//  editHistoryViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/16/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit
import CoreData

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
    var editedPainScore: Int = 0
    var entryIDToBeUpdated = 0
    
    var labelsToBeStyled = [UILabel]()
    var painScoreEntries_CD = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "WritTN"

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
    
    
    
    // Function to get selected entry and update
    func updatePainEntry() {
        let appDelegate_CD = UIApplication.sharedApplication().delegate as! AppDelegate
        let context_CD = appDelegate_CD.managedObjectContext
        
        let request_CD = NSFetchRequest(entityName: "PainHistory")
        let predicate_CD = NSPredicate(format: "entryID_CD == %d", entryIDToBeUpdated)
        request_CD.predicate = predicate_CD
        
        do {
            let getEntryToBeUpdated = try context_CD.executeFetchRequest(request_CD) as! [NSManagedObject]
            getEntryToBeUpdated[0].setValue(editedPainScore, forKey: "painScore_CD")
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
        
        do {
            try context_CD.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    
    @IBAction func adjustPainScore(sender: UIStepper) {
        editedPainScore = Int(sender.value)
        painScoreLabel.text = "Pain: \(Int(sender.value))"
    }
    
    // Dismiss view with cancel button
    @IBAction func cancelButtonAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveButtonAction(sender: AnyObject) {
        updatePainEntry()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Navigation
    

}
