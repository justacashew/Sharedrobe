//
//  AddItemViewController.swift
//  Sharedrobe
//
//  Created by Dhawal Chandra on 2/21/15.
//  Copyright (c) 2015 Senior Design. All rights reserved.
//

import UIKit
import Realm

class AddItemViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var clothing : ClothingProfile!
    var userProf = SignupVC().user_prof
    
    @IBOutlet weak var materialText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var clothType: UIPickerView!
    @IBOutlet weak var sizeType: UISegmentedControl!
    @IBOutlet weak var genderType: UISegmentedControl!
    @IBOutlet weak var costText: UITextField!
    @IBOutlet weak var colorText: UITextField!
    var typeArray:NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        println(RLMRealm.defaultRealm().path)
        typeArray = ["Shirts", "Pants", "Dresses"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(typeArray[row])"
    }

    func addNewClothing() {
        let realm = RLMRealm.defaultRealm()
        
        realm.beginWriteTransaction()
        let newClothing = ClothingProfile()
        
        newClothing.name = nameText.text
        newClothing.cost = costText.text
        newClothing.gender = genderType.selectedSegmentIndex
        newClothing.size = sizeType.selectedSegmentIndex
        newClothing.color = colorText.text
        newClothing.material = materialText.text
        newClothing.connectedUsername = userProf
        
        realm.addObject(newClothing)
        
        clothing = newClothing
        userProf.clothing_profile.addObject(clothing)
        realm.commitWriteTransaction()
        
    }
    @IBAction func doneWithAddingItem(sender: UIButton) {
        addNewClothing()
        
        //segue to go back to UserProfileViewController
        

    }
    //validation function to check if all the fields are filled.
    
//    func validateFields() -> Bool {
//        
//        //if (nameTextField.text.isEmpty || descriptionTextField.text.isEmpty) {
//        if (nameText.text.isEmpty || descriptionTextField.text.isEmpty || selectedCategory == nil) {
//            
//            let alertController = UIAlertController(title: "Validation Error", message: "All fields must be filled", preferredStyle: .Alert)
//            let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: {(alert : UIAlertAction!) in
//                alertController.dismissViewControllerAnimated(true, completion: nil)
//            })
//            alertController.addAction(alertAction)
//            presentViewController(alertController, animated: true, completion: nil)
//            
//            return false
//            
//        } else {
//            return true
//        }
//    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
