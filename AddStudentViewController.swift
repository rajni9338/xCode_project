//
//  AddStudentViewController.swift
//  ID19522308-Assignment
//
//  Created by Ahmad Naeem on 27/10/18.
//  Copyright © 2018 Ahmad Naeem. All rights reserved.
//

import UIKit
import CoreData

class AddStudentViewController: UIViewController {

    //variables from viewController.
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageStepper: UIStepper!
    @IBOutlet weak var courseTextBox: UITextField!
    @IBOutlet weak var addressTextBox: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Method of run when Submit is pressed - save all to database.
    @IBAction func SubmitOnClick(_ sender: Any) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newStudent = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context)
        
        let index = genderControl.selectedSegmentIndex
        
        var gender: String
        
        if(index == -1) {
            gender = "N/A"
        }
        
        else if (index == 0){
            gender = "Male"
        }
        
        else {
            gender = "Female"
        }
        
        newStudent.setValue(nameTextBox.text, forKey: "name")
        newStudent.setValue(gender, forKey: "gender")
        newStudent.setValue(courseTextBox.text, forKey: "course")
        newStudent.setValue(Int(ageLabel.text!), forKey: "age")
        newStudent.setValue(addressTextBox.text, forKey: "address")
        
        do {
            try context.save()
            Clear()
            print("Student saved in database.")
        }
        catch {
            
            print("An error has occured")
        }
        
        
        
        
        
    }
    
    //Method to execute code when Cancel button is pressed.
    @IBAction func CancelOnClick(_ sender: Any) {
        
        Clear()
    }
    
    func Clear() {
        
        nameTextBox.text = ""
        ageLabel.text = String(0)
        courseTextBox.text = ""
        addressTextBox.text = ""
        ageStepper.value = 0
    }
    
    @IBAction func OnStepperValueChange(_ sender: UIStepper) {
        let temp = Int(sender.value)
        ageLabel.text = String(temp)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
