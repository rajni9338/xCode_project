//
//  ExamViewController.swift
//  ID19522308-Assignment
//
//  Created by Ahmad Naeem on 26/10/18.
//  Copyright © 2018 Ahmad Naeem. All rights reserved.
//

import UIKit

class ExamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellArray = ["Add Exam", "View Exams"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return number of rows for the table view:
        
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default , reuseIdentifier: "Cell")
        cell.textLabel?.text = cellArray[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell: #\(indexPath.row)")
        
        if(indexPath.row == 0){
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "AddExamViewController")
            self.present(vc, animated: true, completion: nil);
        }
            
        else if(indexPath.row == 1){
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewExamsViewController")
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
