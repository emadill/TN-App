//
//  ConnectWProviderViewController.swift
//  TN App
//
//  Created by Evan Madill on 3/14/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//

import UIKit

class ConnectWProviderViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainContentLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailButtonStyle: UIButton!
    @IBOutlet weak var phoneButtonStyle: UIButton!
    
    var labelsToBeStyled = [UILabel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelsToBeStyled.append(titleLabel)
        labelsToBeStyled.append(mainContentLabel)
        labelsToBeStyled.append(emailLabel)
        labelsToBeStyled.append(phoneLabel)
        
        for label in labelsToBeStyled {
            label.layer.cornerRadius = 5.0
            label.clipsToBounds = true
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func emailButtonAction(sender: AnyObject) {
        
    }
    
    @IBAction func phoneButtonAction(sender: AnyObject) {
        if let providerContactNumber = NSURL(string: "tel://4126470989") {
            UIApplication.sharedApplication().openURL(providerContactNumber)
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
