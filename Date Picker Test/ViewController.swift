//
//  ViewController.swift
//  Date Picker Test
//
//  Created by 김종현 on 2018. 4. 10..
//  Copyright © 2018년 김종현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func changeDatePicker(_ sender: Any) {
        print("change Date Picker")
        print(myDatePicker.date)
        
        // dateFormat
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd HH:mm:ss EE"
        timeLabel.text = formatter.string(from: myDatePicker.date)
        
//        timeLabel.text = String(describing: myDatePicker.date)
        
    }
}

