//
//  ViewStudentsViewController.swift
//  ID19522308-Assignment
//
//  Created by Ahmad Naeem on 27/10/18.
//  Copyright © 2018 Ahmad Naeem. All rights reserved.
//

import UIKit
import CoreData

class ViewStudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
                        
                        let temp = result.value(forKey: "age") as! Int
                        studentArray.append("\(name), \(temp)")
                        
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
        
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default , reuseIdentifier: "Cell")
        cell.textLabel?.text = studentArray[indexPath.row]
        print("Index: \(indexPath.row)")
        print("Cell: \(studentArray[indexPath.row])")
        return cell
    }
}
