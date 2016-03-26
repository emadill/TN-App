//
//  GetHelpViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/12/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit

class GetHelpViewController: UIViewController {
    
    var labelsToBeStyled = [UILabel]()
    var buttonsToBeStyled = [UIButton]()
    
    @IBOutlet weak var getHelp: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var connectProviderLabel: UILabel!
    @IBOutlet weak var findProviderLabel: UILabel!
    
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var connectProviderButton: UIButton!
    @IBOutlet weak var findProviderButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        labelsToBeStyled.append(getHelp)
        labelsToBeStyled.append(contactLabel)
        labelsToBeStyled.append(connectProviderLabel)
        labelsToBeStyled.append(findProviderLabel)
        
        for label in labelsToBeStyled {
            label.layer.cornerRadius = 5.0
            label.clipsToBounds = true
        }
        
        for button in buttonsToBeStyled {
            button.layer.cornerRadius = 5.0
            button.clipsToBounds = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "WritTN"
    }
    
    @IBAction func findProviderButtonAction(sender: AnyObject) {
        // Be sure to include http(s)
        // Safely unwrap optional?
        if let searchURL = NSURL(string: "http://fpa-support.org/healthcare-providers/") {
            UIApplication.sharedApplication().openURL(searchURL)
        }
    }
    
    @IBAction func connectWithProviderAction(sender: AnyObject) {
        // Launch new view controller with contact information on saved provider
    }

    @IBAction func callContactButtonAction(sender: AnyObject) {
        if let contactNumber = NSURL(string: "tel://5555555555") {
            UIApplication.sharedApplication().openURL(contactNumber)
        }
    }
  
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationItem.title = nil
    }

}
