//
//  AddPhotoViewController.swift
//  Sharedrobe
//
//  Created by Megan Yee on 2/25/15.
//  Copyright (c) 2015 Senior Design. All rights reserved.
//

import UIKit
import Realm

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePic: UIImageView!
    let picker = UIImagePickerController()
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }

    
    @IBAction func photoFromLibrary(sender: UIButton) {
        picker.allowsEditing = false //grabs full picture
        picker.sourceType = .PhotoLibrary //define sourceType
        
        //        picker.modalPresentationStyle = .Popover
        presentViewController(picker, animated: true, completion: nil) //present picker in full screen modual
        //        picker.popoverPresentationController?.barButtonItem = sender
    }
    
    @IBAction func takePhoto(sender: UIButton) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            presentViewController(picker, animated: true, completion: nil)
        } else {
            noCamera() //alert if there is no camera on the device
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //display current profile picture
        let user = UserProfile.objectsWhere("username = 'testyunowork'")
        var tempuser = user.objectAtIndex(0) as UserProfile
        var picData = tempuser.userProfPic
        let defpic = UIImage(data: picData!)
        profilePic.image = defpic
        
        //for picking camera
        picker.delegate = self
        
        //display user name
        userNameLabel.text = tempuser.username
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Delegates
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var chosenImage = info[UIImagePickerControllerOriginalImage] as UIImage //put image into a variable
        profilePic.contentMode = .ScaleAspectFit //size image down to fit UIImage from Camera image
        profilePic.image = chosenImage //4
        dismissViewControllerAnimated(true, completion: nil) //5
    }
    
    //get delegate out of the library
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
 
    //MARK: - SEGUES
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //right before segue happens, prepares any code before it happens
        var DestViewController: UserProfileViewController = segue.destinationViewController as UserProfileViewController
        
        DestViewController.displayUserPic = profilePic
        //taking data from this View and pushing it to the next view
    }
    
    @IBAction func doneButton(segue:UIStoryboardSegue) {
        saveUserPic()
    }
    
    func saveUserPic() {
//        let usernamestr = "testyunowork"
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        var qres = UserProfile.objectsWhere("username = 'testyunowork'")
        let tempuser = qres.objectAtIndex(0) as UserProfile
        tempuser.userProfPic = UIImagePNGRepresentation(profilePic.image)
        realm.commitWriteTransaction()
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
