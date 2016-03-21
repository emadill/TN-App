//
//  historyTableViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/14/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit
import CoreData

class historyTableViewController: UITableViewController {
    
    //MARK: Properties
    var sampleDataset = [historyScoreCell]()
    var painScoreHistory_CD = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LOAD SAMPLE DATA -- SHOULD BE REMOVED LATER
        loadSampleDataset()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // getHistoryData()
    }
    
    // Get data from DB
    func getHistoryData() {
        let appDelegate_CD = UIApplication.sharedApplication().delegate as! AppDelegate
        let context_CD = appDelegate_CD.managedObjectContext
        
        let fetchRequest_CD = NSFetchRequest(entityName: "PainHistory")
        do {
            let historyResults = try context_CD.executeFetchRequest(fetchRequest_CD)
            painScoreHistory_CD = historyResults as! [NSManagedObject]
            
        } catch let error as NSError {
            print("Could not get records \(error)")
        }
    }
    
    func loadSampleDataset() {
        
        // Load sample data -- NB:
        // THIS CODE SHOULD BE DELETED LATER
        let sampleDatapointImage1 = UIImage(named: "default")
        let sampleDatapoint1 = historyScoreCell(historyScoreString: "8", historyTimestampString: "March 4, 2016 -- 12:13 pm", historyImage: sampleDatapointImage1)
        
        let sampleDatapointImage2 = UIImage(named: "default")
        let sampleDatapoint2 = historyScoreCell(historyScoreString: "4", historyTimestampString: "March 2, 2016 -- 8:39 pm", historyImage: sampleDatapointImage2)
        
        let sampleDatapointImage3 = UIImage(named: "default")
        let sampleDatapoint3 = historyScoreCell(historyScoreString: "7", historyTimestampString: "March 1, 2016 -- 5:27 pm", historyImage: sampleDatapointImage3)
        
        sampleDataset.append(sampleDatapoint1)
        sampleDataset.append(sampleDatapoint2)
        sampleDataset.append(sampleDatapoint3)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //THIS WILL NEED TO CHANGE WITH REAL DATA
        return sampleDataset.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "historyCell_Identifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! historyTableViewCell
        
        let historyCell = sampleDataset[indexPath.row]
        cell.historyScoreLabel.text = "Score: " + historyCell.historyScoreString
        cell.historyTimestampLabel.text = historyCell.historyTimestampString
        cell.historyImageview.image = historyCell.historyImage

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "View or edit your history here"
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editHistorySegue" {
            // editHistoryViewController is embedded in a navigation controller not part of historyTableViewController
            let navControl = segue.destinationViewController as! UINavigationController
            let vcToBePresented = navControl.viewControllers[0] as! editHistoryViewController
            
            if let selectedHistoryCell = sender as? historyTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedHistoryCell)!
                let historyCellToBeEdited = sampleDataset[indexPath.row]
                // Labels not yet initialized in editHistoryViewController
                // Have to pass data to temp variables not displayed in view
                // Careful with forcing to Int. May have to clean this up later and wrap in if statement
                vcToBePresented.adjustpainscoreinitialvalue = Double(historyCellToBeEdited.historyScoreString)!
                vcToBePresented.painscorestringtemp = "Pain: " + historyCellToBeEdited.historyScoreString
                vcToBePresented.datetimestringtemp = "Pain: " + historyCellToBeEdited.historyTimestampString
            }
            else {
                print("Error")
            }
        }
        
    }


}
