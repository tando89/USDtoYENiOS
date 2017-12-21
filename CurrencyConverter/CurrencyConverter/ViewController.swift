//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Tan Do  on 12/21/17.
//  Copyright © 2017 Tan Do . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var myLabel1: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myButton1(_ sender: Any) {
        //Get the input from the Text Field
        let textFieldValue = Double(textField1.text!)
        
        //if statement to make sure user cannot leave this Text Field blank
        if textFieldValue != nil {
            let result = Double (textFieldValue! * 112.57)
            
            myLabel1.text = "$\(textFieldValue!) = ¥\(result)"
            //Clear text field after clicking the button
            textField1.text = ""
        } else {
            myLabel1.text = "This field cannot be blank!"
        }
    }
    
}

