//
//  historyTableViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/14/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit

class historyTableViewController: UITableViewController {
    
    //MARK: Properties
    var sampleDataset = [historyScoreCell]()

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}