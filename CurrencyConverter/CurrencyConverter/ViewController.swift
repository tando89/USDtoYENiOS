//
//  ViewController.swift
//  CurrencyConverter With an Asynch Server Call
//
//  Todos -
//  Make A server call to get JSON object
//  Parse the Response to get the exchange rates from the server
//  Save the JSON keys for the Drop Down menu
//  Show the App working using USD to 2 different currencies. This will be 2 different screenshots

import UIKit
import Alamofire
import DropDown
import SwiftyJSON

class ViewController: UIViewController {

    /*
    ** Variables from the First
    ** Input Text Field
    ** Calculate button
    ** Output label
    ** Anything else you can think of
    */
    
    var url = "https://api.fixer.io/latest?base=USD"
    // init and assign a variable to be the JSON object
    // init array of strings. Can be done here or inside server call
    
    // init and assign a variable to be the DropDown menu
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init setup of the drop down menu anchor it to the button
        
            
        // selection action of the button changes the title of the button to the choosen currecny
        .selectionAction = {[weak self] (index, currency) in
            self?..setTitle(currency, for: .normal)
        }
        
        // download exchange rate from the server
        downLoadExchangeRates(_URL: url, success: { (ratesJSON) in
            self.
            //extract the names for the keys from the JSON object to place them on the drop down menu
            for (key,_) in self.{
                self.
            }
            //Assign curreny names to drop down using datasource function
            self.
            //reload the dropdown menu to resynch to main thread
            self.
            
        }) { (error) in
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Show drop down menu onthe button press
    @IBAction func ShowDropDown(_ sender: Any) {
    }
    
    // Function for the button press. It should do the four different things that are within the function.
    @IBAction func myButton1(_ sender: Any) {
        // Get the input from the Text Field
        // if statement to make sure user cannot leave this Text Field blank and has selected a currency
        // Clear text field after clicking the button
    }
    
    func downLoadExchangeRates(_URL :String, success:@escaping (JSON)->Void, failure:@escaping (Error) -> Void){
        Alamofire.request(_URL).responseJSON { (response) -> Void in
            if response.result.isSuccess{
                // parse the json array into just the rates json object
                // Hint... Look at how the JSON object is given to you and what do we want from it?
            }
            if response.result.isFailure {
                let error : Error = response.result.error!
                failure(error)
            }
        }
    }
    
}

