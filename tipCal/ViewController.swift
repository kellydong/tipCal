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
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bill = defaults.double(forKey: "myBill")
        let people = defaults.integer(forKey: "myPeople")
        let tipPercentage = defaults.integer(forKey: "myTipControl")
        
        billField.text = String(bill)
        peopleField.text = String(people)
        tipControl.selectedSegmentIndex = tipPercentage
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let perPerson = total/Double(people)
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        perPersonLabel.text = String(format:"$%.2f", perPerson)
    }

    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount
        let bill = Double(billField.text!) ?? 0
        
        // people divison
        let people = Int(peopleField.text!) ?? 1
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        //calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let perPerson = total/Double(people)
        
        //update tip and total label
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        perPersonLabel.text = String(format:"$%.2f", perPerson)
        
        defaults.set(bill, forKey: "myBill")
        defaults.set(people, forKey: "myPeople")
        defaults.set(tipControl.selectedSegmentIndex, forKey: "myTipControl")
        
        defaults.synchronize()
    }
    
}

