//
//  DatePickerViewController.swift
//  idunno
//
//  Created by Felicia Lo on 3/6/21.
//  Copyright © 2021 Felicia Lo. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var startNFinSwitch: UISegmentedControl!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var finDatePicker: UIDatePicker!
    
    @IBOutlet weak var numDays: UITextField!
    


    override func viewDidLoad() {
        super.viewDidLoad()
       // finDatePicker.isUserInteractionEnabled = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func findDays(sender: Any){
        if startNFinSwitch.selectedSegmentIndex == 2{
            if startDatePicker != nil && finDatePicker != nil{
                if startDatePicker.date < finDatePicker.date {
                    numDays.text = String(Calendar.current.dateComponents([.day], from: startDatePicker.date, to: finDatePicker.date).day!)
                }
            }
        }
    }
    
    @IBAction func textChanged(_ sender: Any) {
        changeFinDate((Any).self);
        changeStartDate((Any).self);
    }

    @IBAction func changeStartDate(_ sender: Any) {
        if startNFinSwitch.selectedSegmentIndex == 0{
                if numDays != nil && numDays.text != "" {
                        var dateComponent = DateComponents()
                        dateComponent.day = Int(numDays.text!)
                    finDatePicker.setDate((Calendar.current.date(byAdding: dateComponent, to: startDatePicker.date)!), animated: true)
            }
        }
    }
    
    @IBAction func changeFinDate(_ sender: Any) {
        if startNFinSwitch.selectedSegmentIndex == 1{
            if numDays != nil && numDays.text != "" {
                    var dateComponent = DateComponents()
                dateComponent.day = Int(numDays.text!)! * -1
                finDatePicker.setDate((Calendar.current.date(byAdding: dateComponent, to: startDatePicker.date)!), animated: true)
        }
        }

    }
    
    @IBAction func changeMode(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            firstLabel.text = "START DATE"
            secondLabel.text = "FINISH DATE"
            numDays.text = ""
            
          
        } else if sender.selectedSegmentIndex == 1{
            firstLabel.text = "FINISH DATE"
            secondLabel.text = "START DATE"
            numDays.text = ""
          
        }else if sender.selectedSegmentIndex == 2{
         //   numDays.isEnabled = false
        }
    }
    
//    @IBAction func finDate(_ sender: Any) {
//            if numDays != nil && numDays.text != ""{
//                    var dateComponent = DateComponents()
//                    dateComponent.day = Int(numDays.text!)
//                finDatePicker.setDate((Calendar.current.date(byAdding: dateComponent, to: startDatePicker.date)!), animated: true)
//        }
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

