//
//  FinDateViewController.swift
//  idunno
//
//  Created by Felicia Lo on 1/23/21.
//  Copyright © 2021 Felicia Lo. All rights reserved.
//

import UIKit

class FinDateViewController: UIViewController {

    @IBOutlet weak var finDate: UITextField!
    
    @IBOutlet weak var startDate: UITextField!
    
    @IBOutlet weak var numDays: UILabel!
    
    let finDatePicker = UIDatePicker()
    let startDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        // Do any additional setup after loading the view.
    }

func createDatePicker(){
    
    startDate.textAlignment = .center
    finDate.textAlignment = .center
    
    //creating toolbar
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    
    let toolbar2 = UIToolbar()
    toolbar2.sizeToFit()
    
    //creating done button
    let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
    let doneBtn2 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
    
    toolbar.setItems([doneBtn], animated: true)
    
    toolbar2.setItems([doneBtn2], animated:true)
    
    //assign toolbar
    startDate.inputAccessoryView = toolbar
    finDate.inputAccessoryView = toolbar2
    
    //assigning date to text field
    startDate.inputView = startDatePicker
    finDate.inputView = finDatePicker
    
    //date picker mode
    startDatePicker.datePickerMode = .date
    finDatePicker.datePickerMode = .date
    
}


@objc func donePressed(){
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    
    numDays.textAlignment = .center
        
    startDate.text = formatter.string(from: startDatePicker.date)
    finDate.text = formatter.string(from: finDatePicker.date)
    
    self.view.endEditing(true)
    
        
    if finDate != nil && startDate != nil{
        var dateComponent = DateComponents()
        dateComponent.day = Int(numDays.text!)

        numDays.text = String(Calendar.current.dateComponents([.day], from: startDatePicker.date, to: finDatePicker.date).day!)
        }
    }
    
}

