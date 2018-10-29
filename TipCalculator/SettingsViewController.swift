//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by RCMACEXT-25 on 10/16/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    @IBOutlet weak var defaultTipBar: UISegmentedControl!
    @IBOutlet weak var currencyBar: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipBar.selectedSegmentIndex = defaults.integer(forKey: "DefaultTipValue")
        currencyBar.selectedSegmentIndex = defaults.integer(forKey: "Currency")
        self.view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func defaultTipChanged(_ sender: Any) {
        defaults.set(defaultTipBar.selectedSegmentIndex, forKey: "DefaultTipValue")
    }
    @IBAction func currencyChanged(_ sender: Any) {
        defaults.set(currencyBar.selectedSegmentIndex, forKey: "Currency")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
