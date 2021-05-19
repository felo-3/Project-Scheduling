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
        if startNFinSwitch.selectedSegmentIndex == 2 {
            finDatePicker.minimumDate = startDatePicker.date
            if startDatePicker != nil && finDatePicker != nil{
                if startDatePicker.date <= finDatePicker.date {
                    var numWKs = Calendar.current.dateComponents([.day], from: startDatePicker.date, to: finDatePicker.date).day!
                    numWKs/=7
                    if (numWKs > 0) {
                        numDays.text = String(numWKs)
                    } else {
                        numDays.text = String(numWKs%7) + " days"
                    }
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
            startDatePicker.maximumDate = finDatePicker.date
            finDatePicker.minimumDate = startDatePicker.date 
                if numDays != nil && numDays.text != "" {
                        var dateComponent = DateComponents()
                    dateComponent.day = Int(numDays.text!)!*7
                    finDatePicker.setDate((Calendar.current.date(byAdding: dateComponent, to: startDatePicker.date)!), animated: true)
                } else {
                               finDatePicker.date = startDatePicker.date
                               
                }
        }
    }
    
    @IBAction func changeFinDate(_ sender: Any) {
        if startNFinSwitch.selectedSegmentIndex == 1{
            startDatePicker.minimumDate = finDatePicker.date
            if numDays != nil && numDays.text != "" {
                    var dateComponent = DateComponents()
                dateComponent.day = Int(numDays.text!)! * -7
                finDatePicker.setDate((Calendar.current.date(byAdding: dateComponent, to: startDatePicker.date)!), animated: true)
            } else {
                finDatePicker.date = startDatePicker.date
                
            }
        }

    }
    
    @IBAction func changeMode(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            startDatePicker.minimumDate = nil
            startDatePicker.maximumDate = nil
            
            firstLabel.text = "START DATE"
            secondLabel.text = "FINISH DATE"
            numDays.text = ""
            
            startDatePicker.setDate(Date(),animated: false)
            finDatePicker.setDate(Date(),animated: false)
//            numDays.isUserInteractionEnabled = true
//            finDatePicker.isUserInteractionEnabled = false
//            print("0")
//            if finDatePicker.isUserInteractionEnabled == true{
//                           print("F")
//                       }else{
//                           print ("T")
//                       }
          
        }
        if sender.selectedSegmentIndex == 1 {
            startDatePicker.minimumDate = nil
            startDatePicker.maximumDate = nil
            
            firstLabel.text = "FINISH DATE"
            secondLabel.text = "START DATE"
            numDays.text = ""
            
            startDatePicker.setDate(Date(),animated: false)
            finDatePicker.setDate(Date(),animated: false)
//            numDays.isUserInteractionEnabled = true
//            finDatePicker.isEnabled = false
//            print("1")
//            if finDatePicker.isUserInteractionEnabled == false{
//                           print("F")
//                       }else{
//                           print ("T")
//                       }
//
        }
        if sender.selectedSegmentIndex == 2 {
            startDatePicker.minimumDate = nil
            startDatePicker.maximumDate = nil
            
            numDays.text = ""
            startDatePicker.setDate(Date(),animated: false)
            finDatePicker.setDate(Date(),animated: false)
//            numDays.isUserInteractionEnabled = false
            finDatePicker.minimumDate = startDatePicker.date
//            finDatePicker.isEnabled = true
//            print ("2")
//            if finDatePicker.isUserInteractionEnabled == false{
//                print("F")
//            }else{
//                print ("T")
//            }
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

