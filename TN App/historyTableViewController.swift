//
//  historyTableViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/14/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit
import CoreData

class historyTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    //MARK: Properties
    var sampleDataset = [historyScoreCell]()
    var painScoreHistory_CD = [NSManagedObject]()
    var fetchedResultsController: NSFetchedResultsController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LOAD SAMPLE DATA -- SHOULD BE REMOVED LATER
        // loadSampleDataset()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Initialize fetchedResultsController
        self.navigationItem.title = "WritTN"
        initializeFetchedResultsController()
    }
    
    
    // This may not work
    func initializeFetchedResultsController() {
        let request_CD = NSFetchRequest(entityName: "PainHistory")
        // Sort descriptors encode how the table should be sorted
        let timestampSort = NSSortDescriptor(key: "timestamp_CD", ascending: false)
        request_CD.sortDescriptors = [timestampSort]
        
        let appDelegate_CD = UIApplication.sharedApplication().delegate as! AppDelegate
        let context_CD = appDelegate_CD.managedObjectContext
        // Cache set to nil, otherwise it needs to be deleted everytime data is modified.
        // May want to revisit this if the datasets get large enough
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request_CD, managedObjectContext: context_CD, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
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
    
    func configureCell_CD(cell: historyTableViewCell, indexPath: NSIndexPath) {
        // Test code for fetched objects
        let painHistoryEntry_CD = fetchedResultsController.objectAtIndexPath(indexPath) as! PainHistory
        cell.historyScoreLabel.text = "Score: \(painHistoryEntry_CD.painScore_CD!)"
        cell.historyTimestampLabel.text = "\(painHistoryEntry_CD.timestamp_CD!)"
        cell.historyImageview.image = UIImage(named: "default")
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
        // Test code for fetched objects
        //return fetchedResultsController.sections!.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //THIS WILL NEED TO CHANGE WITH REAL DATA
        //return sampleDataset.count
        
        // Test code for fetched objects
        let sections_CD = fetchedResultsController.sections! as [NSFetchedResultsSectionInfo]
        let sectionInfo_CD = sections_CD[section]
        return sectionInfo_CD.numberOfObjects
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "historyCell_Identifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! historyTableViewCell
        
        //let historyCell = sampleDataset[indexPath.row]
        //cell.historyScoreLabel.text = "Score: " + historyCell.historyScoreString
        //cell.historyTimestampLabel.text = historyCell.historyTimestampString
        //cell.historyImageview.image = historyCell.historyImage
        
        // Test code for fetched objects
        configureCell_CD(cell, indexPath: indexPath)
        
        return cell
    }
    
    // Add ability to delete rows from table
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let appDelegate_CD = UIApplication.sharedApplication().delegate as! AppDelegate
        let context_CD = appDelegate_CD.managedObjectContext
        
        switch editingStyle {
        case .Delete: let painHistoryEntry_CD = fetchedResultsController.objectAtIndexPath(indexPath) as! PainHistory
            context_CD.deleteObject(painHistoryEntry_CD)
            do {
                try context_CD.save()
            } catch let error as NSError {
                print("Error saving after deleting object: \(error.localizedDescription)")
            }
        default: break
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "View or edit your history here"
    }
  
    
    
    // MARK: FetchedResultsController delegate
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .Insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Move:
            break
        case .Update:
            break
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        case .Update:
            configureCell_CD(self.tableView.cellForRowAtIndexPath(indexPath!) as! historyTableViewCell, indexPath: indexPath!)
        case .Move:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
            tableView.insertRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationItem.title = nil
        
        if segue.identifier == "editHistorySegue" {
            // editHistoryViewController is embedded in a navigation controller not part of historyTableViewController
            let navControl = segue.destinationViewController as! UINavigationController
            let vcToBePresented = navControl.viewControllers[0] as! editHistoryViewController
            
            if let selectedHistoryCell = sender as? historyTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedHistoryCell)!
                let painHistoryEntry_CD = fetchedResultsController.objectAtIndexPath(indexPath) as! PainHistory
                // Labels not yet initialized in editHistoryViewController
                // Have to pass data to temp variables not displayed in view
                // Careful with forcing to Int. May have to clean this up later and wrap in if statement
                vcToBePresented.adjustpainscoreinitialvalue = Double(painHistoryEntry_CD.painScore_CD!)
                vcToBePresented.editedPainScore = Int(painHistoryEntry_CD.painScore_CD!)
                vcToBePresented.painscorestringtemp = "Pain: \(painHistoryEntry_CD.painScore_CD!)"
                vcToBePresented.datetimestringtemp = "\(painHistoryEntry_CD.timestamp_CD!)"
                // Should be only part that needs to be kept
                vcToBePresented.entryIDToBeUpdated = Int(painHistoryEntry_CD.entryID_CD!)
                // Load up any notes that have been edited
                if painHistoryEntry_CD.painNotes_CD != nil {
                    vcToBePresented.notesToBeDisplayedOnLoad = painHistoryEntry_CD.painNotes_CD! as String
                } else {
                    vcToBePresented.notesToBeDisplayedOnLoad = "Notes:"
                }
            }
            else {
                print("Error")
            }
        }
    }


}
