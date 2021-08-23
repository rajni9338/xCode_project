//
//  ViewController.swift
//  ID19522308-Assignment
//
//  Created by Ahmad Naeem on 18/10/18.
//  Copyright © 2018 Ahmad Naeem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TabItemStudent: UITabBarItem!
    
    @IBOutlet weak var variableHead: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initial page:
        
        //Swipe Right - Students page
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        
        //Swipe Left - Exams page
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        
        //Swipe Up - Map
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe(gesture:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        
    }
    
    
    @objc func swipe(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizer.Direction.right:
                let storyboard = UIStoryboard(name: "Main", bundle: nil);
                let vc = storyboard.instantiateViewController(withIdentifier: "ExamViewController")
                self.present(vc, animated: true, completion: nil);
                print("Swiped Right")
                
            case UISwipeGestureRecognizer.Direction.left:
                let storyboard = UIStoryboard(name: "Main", bundle: nil);
                let vc = storyboard.instantiateViewController(withIdentifier: "StudentViewController")
                self.present(vc, animated: true, completion: nil);
                print("Swiped Left")
                
            case UISwipeGestureRecognizer.Direction.up:
                let storyboard = UIStoryboard(name: "Main", bundle: nil);
                let vc = storyboard.instantiateViewController(withIdentifier: "MapViewController")
                self.present(vc, animated: true, completion: nil);
                print("Swiped Up")
                
            default:
                break
            }
        }
        
    }


}

