//
//  HomeVC.swift
//  Sharedrobe
//
//  Created by Dhawal Chandra on 2/24/15.
//  Copyright (c) 2015 Senior Design. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    var searchOption:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shirtsTapped(sender: UIButton) {
         //let somevar = HomeResultViewController.filterResultsWithSearchString
        searchOption = "shirt"
         //self.performSegueWithIdentifier("goto_results", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goto_results" {
        let homeVC = segue.destinationViewController as HomeResultViewController
        if(searchOption == "shirt"){
            homeVC.searchOption = "shirt"
        }
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
