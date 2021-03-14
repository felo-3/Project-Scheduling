//
//  DatePickerViewController.swift
//  idunno
//
//  Created by Felicia Lo on 3/6/21.
//  Copyright © 2021 Felicia Lo. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var lockFin: UISwitch!
    @IBOutlet weak var lockStart: UISwitch!
    @IBOutlet weak var numDatelock: UISwitch!
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var finDatePicker: UIDatePicker!
    
    @IBOutlet weak var numDays: UITextField!
    
    @IBOutlet weak var wkDays: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func startDate(_ sender: Any) {
    }
    
    @IBAction func finDate(_ sender: Any) {
        if lockStart.isOn && numDatelock.isOn{
            if numDays != nil && numDays.text != ""{
                    var dateComponent = DateComponents()
                    dateComponent.day = Int(numDays.text!)
                    finDatePicker.date = Calendar.current.date(byAdding: dateComponent, to: startDatePicker.date)!
            }
        }
    }
    
    @IBAction func startDateLock(_ sender: UISwitch) {
        if lockStart.isOn{
            startDatePicker.isUserInteractionEnabled = false
        }else{
            startDatePicker.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func finDateLocked(_ sender: UISwitch) {
        if lockFin.isOn{
            finDatePicker.isUserInteractionEnabled = false
        } else{
            finDatePicker.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func lockNumDate(_ sender: UISwitch) {
        if numDatelock.isOn{
            numDays.isUserInteractionEnabled = false
        } else{
            numDays.isUserInteractionEnabled = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

