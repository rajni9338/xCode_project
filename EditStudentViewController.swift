//
//  EditStudentViewController.swift
//  ID19522308-Assignment
//
//  Created by Ahmad Naeem on 27/10/18.
//  Copyright © 2018 Ahmad Naeem. All rights reserved.
//

import UIKit
import CoreData

class EditStudentViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerview: UIPickerView!
    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBOutlet weak var ageStepper: UIStepper!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var courseTextBox: UITextField!
    @IBOutlet weak var addressTextBox: UITextField!
    
    var selectedStudent: String = ""
    
    var studentArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            var i: Int = 0
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    if let name = result.value(forKey: "name") as? String {
                        
                        studentArray.append(name)
                        print(studentArray[i])
                    }
                    
                    i += 1
                }
            }
                
            else {
                
                print("An Error has occured in fetching result.")
            }
        }
            
        catch {
            
            print("Inside Catch")
        }
        
        
        pickerview.dataSource = studentArray as? UIPickerViewDataSource

        // Do any additional setup after loading the view.
    }
    

    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return studentArray.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return studentArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedStudent = studentArray[row]
    }
    
    
    @IBAction func SelectOnClick(_ sender: Any) {
    
        print(selectedStudent)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)

            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    let name = result.value(forKey: "name") as? String
                    
                    if name == selectedStudent {
                        
                        let gender = result.value(forKey: "gender") as? String
                        print(gender)
                        if gender == "Male" {
                            genderControl.selectedSegmentIndex = 0
                        }
                        
                        else {
                            genderControl.selectedSegmentIndex = 1
                        }
                        let temp = result.value(forKey: "age") as! Int
                        ageLabel.text = String(temp)
                        courseTextBox.text = result.value(forKey: "course") as? String
                        addressTextBox.text = result.value(forKey: "address") as? String
                    }
                }
            }
                
            else {
                
                print("An Error has occured in fetching result.")
            }
        }
            
        catch {
            
            print("Inside Catch")
        }
    }
    
    @IBAction func UpdateOnclick(_ sender: Any) {
    }
    
    
    @IBAction func StepperValueChange(_ sender: UIStepper) {
        
        let temp = Int(sender.value)
        ageLabel.text = String(temp)
    }
    
    
}
