//
//  HomeViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/12/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

// App is set to only run in portrait currently

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var checkHistoryButtonStyle: UIButton!
    @IBOutlet weak var recordNewEventButtonStyle: UIButton!
    @IBOutlet weak var TNShareButtonStyle: UIButton!
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsImageLabelBackground: UIImageView!
    // Turn off automatically refresh view for subview
    // Avoids annoying building w every keystroke
    @IBOutlet weak var graphViewBackground: homeGraphView!
    @IBOutlet weak var seeScoresButtonStyle: UIButton!
    
    var labelsToBeStyled = [UILabel]()
    var buttonsToBeStyled = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Edit how far down the page to scroll
        homeScrollView.contentSize.height = 1000
        
        labelsToBeStyled.append(welcomeLabel)
        labelsToBeStyled.append(newsLabel)
        
        buttonsToBeStyled.append(checkHistoryButtonStyle)
        buttonsToBeStyled.append(recordNewEventButtonStyle)
        buttonsToBeStyled.append(TNShareButtonStyle)
        buttonsToBeStyled.append(seeScoresButtonStyle)
        
        for label in labelsToBeStyled {
            label.layer.cornerRadius = 5.0
            label.clipsToBounds = true
        }
        
        for button in buttonsToBeStyled {
            button.layer.cornerRadius = 5.0
            button.clipsToBounds = true
        }
        
        newsImageLabelBackground.layer.cornerRadius = 5.0
        newsImageLabelBackground.clipsToBounds = true
        graphViewBackground.layer.cornerRadius = 5.0
        graphViewBackground.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "WritTN"
    }
    
    @IBAction func TNShareButtonAction(sender: AnyObject) {
        if let connectURL = NSURL(string: "http://fpa-support.org/find-help/") {
            UIApplication.sharedApplication().openURL(connectURL)
        }
    }

    @IBAction func recordNewEventButtonAction(sender: AnyObject) {
        // Change tab (0 = left)
        tabBarController?.selectedIndex = 1
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Set title to nil when switching views so back button is preserved
        self.navigationItem.title = nil
    }
    

}
