//
//  AddClothingPhotoViewController.swift
//  Sharedrobe
//
//  Created by Megan Yee on 3/1/15.
//  Copyright (c) 2015 Senior Design. All rights reserved.
//

import UIKit
import Realm

class AddClothingPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
        
        @IBOutlet weak var profilePic: UIImageView!
        
        var user = MyVars.username!
        func noCamera(){
            let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
            alertVC.addAction(okAction)
            presentViewController(alertVC, animated: true, completion: nil)
        }
        
        let picker = UIImagePickerController()
        
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
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            picker.delegate = self
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func chooseImageTapped(sender: UIButton) {
            picker.allowsEditing = false //grabs full picture
            picker.sourceType = .PhotoLibrary //define sourceType
            
            //        picker.modalPresentationStyle = .Popover
            presentViewController(picker, animated: true, completion: nil) //present picker in full screen modual
            //        picker.popoverPresentationController?.barButtonItem = sender
            
        }
        
        @IBAction func takeImageTapped(sender: UIButton) {
            if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
                picker.allowsEditing = false
                picker.sourceType = UIImagePickerControllerSourceType.Camera
                picker.cameraCaptureMode = .Photo
                presentViewController(picker, animated: true, completion: nil)
            } else {
                noCamera() //alert if there is no camera on the device
            }
            
        }
        @IBAction func doneTapped(sender: UIButton) {
            //profpic1 = profilePic.image
            //let user = UserProfile()
            //let cloth = ClothingProfile()
            //        let realm = MyVars.realm
            //
            //        realm.beginWriteTransaction()
            //
            //        var userProf2 = UserProfile.objectsWhere("username = '\(user)'")
            //        var userProf = userProf2.objectAtIndex(0) as UserProfile
            //        //var temp = userProf2.count
            //        //println("\(temp)")
            //        userProf.clo
            //        userProf.clothing_profile.addObject(newClothing)
            //        realm.commitWriteTransaction()
            var temp = profilePic.image! as UIImage
            //var name = UIImage(named: "\(temp)")
            
            MyVars.clothpic = UIImagePNGRepresentation(temp)
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
