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
    @IBOutlet weak var currentTimeLabel: UILabel!
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // initial Picker Time setting
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
    }
    
    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        currentTimeLabel.text = formatter.string(from: date)
        
        if currentTimeLabel.text == timeLabel.text {
            view.backgroundColor = UIColor.red
            
            // Alert
            let timeAlert = UIAlertController(title: "알림", message: "설정된 시간입니다!!!", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "네", style: .default, handler: nil)
//            let okAction = UIAlertAction(title: "네", style: .default, handler: { (action:UIAlertAction) -> Void in
//                    self.view.backgroundColor = UIColor.white
//                })
            
            let okAction = UIAlertAction(title: "네", style: .default) {
                (action:UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.white
                }
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            timeAlert.addAction(okAction)
            timeAlert.addAction(cancelAction)
            
            present(timeAlert, animated: true, completion: nil)
        }
    }

    @IBAction func changeDatePicker(_ sender: Any) {
        // dateFormat
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
    }
}

