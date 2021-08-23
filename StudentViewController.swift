//
//  StudentViewController.swift
//  ID19522308-Assignment
//
//  Created by Ahmad Naeem on 26/10/18.
//  Copyright © 2018 Ahmad Naeem. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellContents = ["Add Student", "Edit Student", "View Students"]
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the number of rows that we want in our table.
        return cellContents.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default , reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContents[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell: #\(indexPath.row)")
        
        if(indexPath.row == 0){
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "AddStudentViewController")
            self.present(vc, animated: true, completion: nil);
        }
        
        else if(indexPath.row == 1){
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "EditStudentViewController")
            self.present(vc, animated: true, completion: nil);
        }
        
        else if(indexPath.row == 2){
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewStudentsViewController")
            self.present(vc, animated: true, completion: nil);
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
