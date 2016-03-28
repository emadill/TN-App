//
//  averageScoresViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/28/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit
import CoreData

class averageScoresViewController: UIViewController {
    // MARK: Properties
    var entriesHistory = [NSManagedObject]()
    var averagePainScore = 0.0
    var percentEyePain = 0.0
    var percentCheekPain = 0.0
    var percentJawPain = 0.0
    var currentDate = NSDate()
    var episodesPerDay = 0.0
    
    @IBOutlet weak var episodesBackgroundLabel: UILabel!
    @IBOutlet weak var averageScoreBackgroundLabel: UILabel!
    @IBOutlet weak var eyePainBackgroundLabel: UILabel!
    @IBOutlet weak var cheekPainBackgroundLabel: UILabel!
    @IBOutlet weak var jawPainBackgroundLabel: UILabel!
    
    @IBOutlet weak var averageScoreLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var eyePainLabel: UILabel!
    @IBOutlet weak var cheekPainLabel: UILabel!
    @IBOutlet weak var jawPainLabel: UILabel!
    
    var labelsToBeStyled = [UILabel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelsToBeStyled.append(episodesBackgroundLabel)
        labelsToBeStyled.append(averageScoreBackgroundLabel)
        labelsToBeStyled.append(eyePainBackgroundLabel)
        labelsToBeStyled.append(cheekPainBackgroundLabel)
        labelsToBeStyled.append(jawPainBackgroundLabel)
        
        for label in labelsToBeStyled {
            label.layer.cornerRadius = 5.0
            label.clipsToBounds = true
        }
        
        getHistory()
        // Avoid calling divisions, etc. if no data available
        if entriesHistory.count > 0 {
            calculateAverages()
            calculateEpisodesPerDay()
        
            averageScoreLabel.text = averageScoreLabel.text! + String(format: "%.2f", averagePainScore)
            eyePainLabel.text = eyePainLabel.text! + String(format: "%.2f", percentEyePain)
            cheekPainLabel.text = cheekPainLabel.text! + String(format: "%.2f", percentCheekPain)
            jawPainLabel.text = jawPainLabel.text! + String(format: "%.2f", percentJawPain)
            episodesLabel.text = episodesLabel.text! + String(format: "%.2f", episodesPerDay)
        } else {
            averageScoreLabel.text = averageScoreLabel.text! + "N/A"
            episodesLabel.text = episodesLabel.text! + "N/A"
            eyePainLabel.text = eyePainLabel.text! + "N/A"
            cheekPainLabel.text = cheekPainLabel.text! + "N/A"
            jawPainLabel.text = jawPainLabel.text! + "N/A"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Function to get selected entry and update
    func getHistory() {
        let appDelegate_CD = UIApplication.sharedApplication().delegate as! AppDelegate
        let context_CD = appDelegate_CD.managedObjectContext
        
        let request_CD = NSFetchRequest(entityName: "PainHistory")
        let timestampSort = NSSortDescriptor(key: "timestamp_CD", ascending: true)
        request_CD.sortDescriptors = [timestampSort]
        
        do {
            entriesHistory = try context_CD.executeFetchRequest(request_CD) as! [NSManagedObject]
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
    
    func calculateAverages() {
        var sumOfScores = 0
        var eyePainScore = 0
        var cheekPainScore = 0
        var jawPainScore = 0
        
        for entry in 0..<entriesHistory.count {
            sumOfScores += entriesHistory[entry].valueForKey("painScore_CD") as! Int
            eyePainScore += entriesHistory[entry].valueForKey("earPain_CD") as! Int
            cheekPainScore += entriesHistory[entry].valueForKey("cheekPain_CD") as! Int
            jawPainScore += entriesHistory[entry].valueForKey("jawPain_CD") as! Int
        }
        
        let totalEntries = Double(entriesHistory.count)
        averagePainScore = Double(sumOfScores) / totalEntries
        percentEyePain = Double(eyePainScore) / totalEntries
        percentCheekPain = Double(cheekPainScore) / totalEntries
        percentJawPain = Double(jawPainScore) / totalEntries
        
    }
    
    func calculateEpisodesPerDay() {
        let dateFormatter = NSDateFormatter()
        let calendar = NSCalendar.currentCalendar()
        let calendarUnit: NSCalendarUnit = .Day
        let startDateString = entriesHistory[0].valueForKey("timestamp_CD") as! String
        // Important -- Have to tell formatter what the string looks like
        dateFormatter.dateFormat = "MMMM dd, yyyy -- h:mm a"
        let startDateCalendarValue = dateFormatter.dateFromString(startDateString)!
        
        let daysFromFirstEntry = calendar.components(calendarUnit, fromDate: startDateCalendarValue, toDate: currentDate, options: []).day
        // Add 1 to days from first entry to make set inclusive
        episodesPerDay = Double(entriesHistory.count) / Double(daysFromFirstEntry + 1)
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
