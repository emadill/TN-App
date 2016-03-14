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
            button.layer.cornerRadius = 10.0
            button.clipsToBounds = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func findProviderButtonAction(sender: AnyObject) {
        // Be sure to include http(s)
        // Safely unwrap optional?
        if let searchURL = NSURL(string: "https://www.google.com/#q=trigeminal+neuralgia") {
            UIApplication.sharedApplication().openURL(searchURL)
        }
    }
    
    @IBAction func connectWithProviderAction(sender: AnyObject) {
        // Launch new view controller with contact information on saved provider
    }

    @IBAction func callContactButtonAction(sender: AnyObject) {
        if let contactNumber = NSURL(string: "tel://3603935365") {
            UIApplication.sharedApplication().openURL(contactNumber)
        }
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
