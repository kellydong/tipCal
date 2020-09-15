//
//  ViewController.swift
//  tipCal
//
//  Created by Kelly Dong on 9/14/20.
//  Copyright © 2020 Kelly Dong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var peopleField: UITextField!
    @IBOutlet weak var perPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount
        let bill = Double(billField.text!) ?? 0
        
        // people divison
        let people = Double(peopleField.text!) ?? 1
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        //calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let perPerson = total/people
        
        //update tip and total label
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        perPersonLabel.text = String(format:"$%.2f", perPerson)
        
    }
    
}

