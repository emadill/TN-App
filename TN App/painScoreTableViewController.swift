//
//  painScoreTableViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/11/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit

class painScoreTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var scoreScale = [painScoreCell]()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadScoreScale()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "WritTN"
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreScale.count
    }
    
    func loadScoreScale() {
        let scoreScaleImage1 = UIImage(named: "stethoscope")!
        let scoreScale1 = painScoreCell(scoreString: "1", scoreImage: scoreScaleImage1)
        
        let scoreScaleImage2 = UIImage(named: "stethoscope")!
        let scoreScale2 = painScoreCell(scoreString: "2", scoreImage: scoreScaleImage2)
        
        let scoreScaleImage3 = UIImage(named: "stethoscope")!
        let scoreScale3 = painScoreCell(scoreString: "3", scoreImage: scoreScaleImage3)
        
        let scoreScaleImage4 = UIImage(named: "stethoscope")!
        let scoreScale4 = painScoreCell(scoreString: "4", scoreImage: scoreScaleImage4)
        
        let scoreScaleImage5 = UIImage(named: "stethoscope")!
        let scoreScale5 = painScoreCell(scoreString: "5", scoreImage: scoreScaleImage5)
        
        let scoreScaleImage6 = UIImage(named: "stethoscope")!
        let scoreScale6 = painScoreCell(scoreString: "6", scoreImage: scoreScaleImage6)
        
        let scoreScaleImage7 = UIImage(named: "stethoscope")!
        let scoreScale7 = painScoreCell(scoreString: "7", scoreImage: scoreScaleImage7)
        
        let scoreScaleImage8 = UIImage(named: "stethoscope")!
        let scoreScale8 = painScoreCell(scoreString: "8", scoreImage: scoreScaleImage8)
        
        let scoreScaleImage9 = UIImage(named: "stethoscope")!
        let scoreScale9 = painScoreCell(scoreString: "9", scoreImage: scoreScaleImage9)
        
        let scoreScaleImage10 = UIImage(named: "stethoscope")!
        let scoreScale10 = painScoreCell(scoreString: "10", scoreImage: scoreScaleImage10)
        
        scoreScale.append(scoreScale10)
        scoreScale.append(scoreScale9)
        scoreScale.append(scoreScale8)
        scoreScale.append(scoreScale7)
        scoreScale.append(scoreScale6)
        scoreScale.append(scoreScale5)
        scoreScale.append(scoreScale4)
        scoreScale.append(scoreScale3)
        scoreScale.append(scoreScale2)
        scoreScale.append(scoreScale1)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "painScoreCell_Identifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! painScoreTableViewCell
        let scoreCell = scoreScale[indexPath.row]
        
        cell.scoreImage.image = scoreCell.scoreImage
        cell.scoreLabel.text = scoreCell.scoreString

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Rate your pain, with 10 being the worst"
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationItem.title = nil
        
        // Get the new view controller
        if segue.identifier == "showPainLocationSegue" {
            let navControl = segue.destinationViewController as! UINavigationController
            let locationDetailViewController = navControl.viewControllers[0] as! painLocationViewController
            
            // Get the cell that was clicked
            if let selectedScoreCell = sender as? painScoreTableViewCell {
                // Console printing score from selected cell -- have to unwrap optional
                // pass data to be saved to next view controller
                let recordedPainScore = selectedScoreCell.scoreLabel.text!
                locationDetailViewController.recordedPainScore = Int(recordedPainScore)!
                // Try to unhighlight cell in the event of cancelled save
                // Make sure to do this after the data has been passed
                selectedScoreCell.selected = false
            }
        }
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

}
