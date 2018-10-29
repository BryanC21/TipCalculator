//
//  ViewController.swift
//  TipCalculator
//
//  Created by RCMACEXT-25 on 10/16/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    var dollar = 0
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        tipSegment.selectedSegmentIndex = defaults.integer(forKey: "DefaultTipValue")
        dollar = defaults.integer(forKey: "Currency")
        if (dollar == 0) {
            tipLabel.text = String(format: "$%.2f", 0)
            totalLabel.text = String(format: "$%.2f", 0)
        }
        if (dollar == 1) {
            tipLabel.text = String(format: "£%.2f", 0)
            totalLabel.text = String(format: "£%.2f", 0)
        }
        if (defaults.double(forKey: "EndTime") - Date().timeIntervalSince1970 < 600) {
            if (defaults.string(forKey: "Bill")?.elementsEqual("0") ?? false) { //! for negation didnt work so this is my workaround
            } else {
                billField.text = defaults.string(forKey: "Bill")
                calculateTip(self)
            }
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        let endTime = Date().timeIntervalSince1970
        defaults.set(endTime, forKey: "EndTime")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.billField.becomeFirstResponder()
        //tipSegment.selectedSegmentIndex = defaults.integer(forKey: "DefaultTipValue")
        //dollar = defaults.integer(forKey: "Currency")
        // Do any additional setup after loading the view, typically from a nib.
        //self.title = "Tip Calculator"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercents = [0.1, 0.15, 0.2]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercents[tipSegment.selectedSegmentIndex]
        let total = bill + tip
        
        if (dollar == 0) {
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }

        if (dollar == 1) {
            tipLabel.text = String(format: "£%.2f", tip)
            totalLabel.text = String(format: "£%.2f", total)
        }
        
        defaults.set(bill, forKey: "Bill")
        
    }
}

