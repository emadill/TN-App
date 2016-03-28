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
        calculateAverages()
        
        averageScoreLabel.text = averageScoreLabel.text! + String(format: "%.2f", averagePainScore)
        eyePainLabel.text = eyePainLabel.text! + String(format: "%.2f", percentEyePain)
        cheekPainLabel.text = cheekPainLabel.text! + String(format: "%.2f", percentCheekPain)
        jawPainLabel.text = jawPainLabel.text! + String(format: "%.2f", percentJawPain)
        
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
        
        for entry in 1..<entriesHistory.count {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
