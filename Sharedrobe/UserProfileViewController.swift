//
//  UserProfileViewController.swift
//  Sharedrobe
//
//  Created by Dhawal Chandra on 2/21/15.
//  Copyright (c) 2015 Senior Design. All rights reserved.
//

import UIKit
import Realm

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var displayUserPic: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userFirstNameLabel: UILabel!
    @IBOutlet weak var userLastNameLabel: UILabel!
    @IBOutlet weak var userDescLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //displaying user profile picture
        let user = UserProfile.objectsWhere("username = 'testyunowork'")

        var tempuser = user.objectAtIndex(0) as UserProfile
        var countuser = user.count
        println(RLMRealm.defaultRealm().path)
        println("count: \(countuser)")
        
        //get image from user profile
        var picData = tempuser.userProfPic
        let defpic = UIImage(data: picData!)
        displayUserPic.image = defpic
        
        //display user information
        userNameLabel.text = tempuser.username
        userFirstNameLabel.text = tempuser.nameFirst
        userLastNameLabel.text = tempuser.nameLast
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
