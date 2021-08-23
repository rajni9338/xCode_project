//
//  ViewExamsViewController.swift
//  ID19522308-Assignment
//
//  Created by Ahmad Naeem on 27/10/18.
//  Copyright © 2018 Ahmad Naeem. All rights reserved.
//

import UIKit
import CoreData

class ViewExamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var examArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Exam")
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    if let name = result.value(forKey: "name") as? String {
                        
                        let temp = result.value(forKey: "date") as! String
                        examArray.append("\(name), \(temp)")
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return examArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default , reuseIdentifier: "Cell")
        cell.textLabel?.text = examArray[indexPath.row]
        print("Index: \(indexPath.row)")
        print("Cell: \(examArray[indexPath.row])")
        return cell
    }
}
