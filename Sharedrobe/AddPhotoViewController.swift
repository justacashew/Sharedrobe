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

    var profpic1 : UIImage?
    
    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    @IBOutlet weak var profilePic: UIImageView!
    let picker = UIImagePickerController()
    
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
        picker.delegate = self
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
    
    @IBAction func doneButton(sender: UIButton) {
/*        profpic1 = profilePic.image
        let user = UserProfile()
       let realm = RLMRealm.defaultRealm()
        
        realm.beginWriteTransaction()
        
        user.profpic = profpic1
        user.nameFirst = "Ducks"
        user.nameLast = "Monkeys"
        realm.addObject(user)
        realm.commitWriteTransaction()
*/    
    }
/*    @IBAction func doneButton(sender: UIButton) {
        self.performSegueWithIdentifier("fromAddPhotoToUserHome", sender: image)
    }
    
    override func override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier = "fromAddPhotoToUserHome"){}
    }
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
