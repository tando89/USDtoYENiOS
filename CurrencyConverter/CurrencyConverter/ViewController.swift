//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Tan Do  on 12/21/17.
//  Copyright © 2017 Tan Do . All rights reserved.
//

import UIKit
import Alamofire
import DropDown
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet var currencyChoice: UIButton!
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet var exchangeResult: UILabel!
    
    var url = "https://api.fixer.io/latest?base=USD"
    var rates = JSON()
    var currencyNames = [String]() // init array of strings
    
    var currencyDropDown = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //init setup of the drop down menu anchor it to the button
        currencyDropDown.anchorView = currencyChoice
        //selection action of the button changes the title of the button to the choosen currecny
        currencyDropDown.selectionAction = {[weak self] (index, currency) in
            self?.currencyChoice.setTitle(currency, for: .normal)
        }
        
        //download exchange rate from the server
        downLoadExchangeRates(_URL: url, success: { (ratesJSON) in
            self.rates = ratesJSON
            //extract the names for the keys to place them on the drop down menu
            for (key,_) in self.rates{
                self.currencyNames.append(key)
            }
            //Assign curreny names to drop down using datasource function
            self.currencyDropDown.dataSource = self.currencyNames
            //reload the dropdown menu to resynch to main thread
            self.currencyDropDown.reloadAllComponents()
            
        }) { (error) in
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Show drop down menu onthe button press
    @IBAction func ShowDropDown(_ sender: Any) {
        currencyDropDown.show()
    }
    
    @IBAction func myButton1(_ sender: Any) {
        //Get the input from the Text Field
        let textFieldValue = Double(textField1.text!)
        
        //if statement to make sure user cannot leave this Text Field blank
        if textFieldValue != nil {
            let result = Double (textFieldValue! * rates[currencyChoice.currentTitle!].double!)
            
            exchangeResult.text = "$\(textFieldValue!) = \(result)" + " \(currencyChoice.currentTitle!)"
            //Clear text field after clicking the button
            textField1.text = ""
        } else {
            exchangeResult.text = "This field cannot be blank!"
        }
    }
    
    func downLoadExchangeRates(_URL :String, success:@escaping (JSON)->Void, failure:@escaping (Error) -> Void){
        Alamofire.request(_URL).responseJSON { (response) -> Void in
            if response.result.isSuccess{
                // parse the json array into just the rates json object
                let responseJSON = JSON(response.result.value!)
                let ratesJSON = JSON(responseJSON["rates"])
                success(ratesJSON)
            }
            if response.result.isFailure {
                let error : Error = response.result.error!
                failure(error)
            }
        }
    }
    
}

