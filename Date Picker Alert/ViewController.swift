//
//  ViewController.swift
//  Date Picker Alert
//
//  Created by D7702_09 on 2018. 4. 17..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timelbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    var myTimer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        datelbl.text = formatter.string(from: myDatePicker.date)
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in self.updateTime()
        })
    }
    
    func updateTime(){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        timelbl.text = formatter.string(from: date)
        
        if timelbl.text == datelbl.text {
            let myAlret = UIAlertController(title : "알림", message: "설정된 시간이 되었습니다.!", preferredStyle: .actionSheet)
            
            let okAction = UIAlertAction(title: "확인", style: .default, handler : {(myaction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.red
            })
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler : nil)
            myAlret.addAction(okAction)
            myAlret.addAction(cancelAction)
            present(myAlret, animated: true, completion: nil)
        }
    }

    @IBAction func changeDatePicker(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        datelbl.text = formatter.string(from: myDatePicker.date)
    }
    
    
    
    
}

