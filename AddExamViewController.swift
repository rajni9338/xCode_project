//
//  AddExamViewController.swift
//  ID19522308-Assignment
//
//  Created by Ahmad Naeem on 27/10/18.
//  Copyright © 2018 Ahmad Naeem. All rights reserved.
//

import UIKit
import CoreData

class AddExamViewController: UIViewController {

    var dateTime: String = ""
    
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var locationTextBox: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func OnSubmit(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newExam = NSEntityDescription.insertNewObject(forEntityName: "Exam", into: context)
        
        
        
        newExam.setValue(nameTextBox.text, forKey: "name")
        newExam.setValue(locationTextBox.text, forKey: "location")
        newExam.setValue(dateTime, forKey: "date")
        
        do {
            try context.save()
            Clear()
            print("Student saved in database.")
        }
        catch {
            
            print("An error has occured")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Exam")
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    if let name = result.value(forKey: "name") as? String {
                        
                        print(name)
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
    
    @IBAction func OnCancel(_ sender: Any) {
        
        Clear()
    }
    
    func Clear() {
        
        nameTextBox.text = ""
        locationTextBox.text = ""
    }

    @IBAction func DatePickerValueChanged(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateTime = dateFormatter.string(from: sender.date)
    }
}
