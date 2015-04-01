//
//  HomeResultViewController.swift
//  Sharedrobe
//
//  Created by Dhawal Chandra on 2/24/15.
//  Copyright (c) 2015 Senior Design. All rights reserved.
//

import UIKit
import Realm

class HomeResultViewController: UIViewController {

    var searchOption:String! //set by HomeVC
    var searchResults:RLMResults?
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var results = filterResultsWithSearchString(searchOption)
        //resultLabel.text = "\(searchResults)"
        resultLabel.text = searchOption
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func filterResultsWithSearchString(searchString: String) -> RLMResults{
        //let predicate = NSPredicate(format: "name BEGINSWITH [c]%@", searchString) // 1
        let AllClothingResults = ClothingProfile.allObjects()
        switch searchString {
        case "shirt":
            return ClothingProfile.objectsWhere("type = 'shirt' OR type = 'shirts'").sortedResultsUsingProperty("name", ascending:true)
        case "pants":
            return ClothingProfile.objectsWhere("type = 'pant' OR type = 'pants'").sortedResultsUsingProperty("name", ascending:true)
        case "dress":
            return ClothingProfile.objectsWhere("type = 'dress' OR type = 'dresses'").sortedResultsUsingProperty("name", ascending:true)
        default:
            return AllClothingResults
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
