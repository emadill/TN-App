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
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var chartLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    
    var labelsToBeStyled = [UILabel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Edit how far down the page to scroll
        homeScrollView.contentSize.height = 1000
        
        labelsToBeStyled.append(welcomeLabel)
        labelsToBeStyled.append(chartLabel)
        labelsToBeStyled.append(newsLabel)
        
        for label in labelsToBeStyled {
            label.layer.cornerRadius = 5.0
            label.clipsToBounds = true
        }
        
        checkHistoryButtonStyle.layer.cornerRadius = 5.0
        checkHistoryButtonStyle.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
