//
//  ViewController.swift
//  idunno
//
//  Created by Felicia Lo on 1/17/21.
//  Copyright © 2021 Felicia Lo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   

    @IBOutlet weak var numDays: UITextField!
    @IBOutlet weak var startDate: UITextField!

    @IBOutlet weak var finishDate: UILabel!
    
    let startDatePicker = UIDatePicker()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numDays.textAlignment = .center
        numDays.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        createDatePicker()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        if numDays != nil && startDate.text != ""{
            var dateComponent = DateComponents()
            dateComponent.day = Int(numDays.text!)
            finishDate.text = formatter.string(from:Calendar.current.date(byAdding: dateComponent, to: startDatePicker.date)!)
        }
    }
    
    func createDatePicker(){
        
        startDate.textAlignment = .center
        
        //creating toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //creating done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar
        startDate.inputAccessoryView = toolbar
        
        //assigning date to text field
        startDate.inputView = startDatePicker
        
        //date picker mode
        startDatePicker.datePickerMode = .date
    }
    
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        finishDate.textAlignment = .center
        
        startDate.text = formatter.string(from: startDatePicker.date)
        self.view.endEditing(true)
        
        if numDays != nil && numDays.text != ""{
            var dateComponent = DateComponents()
            dateComponent.day = Int(numDays.text!)
            finishDate.text = formatter.string(from:Calendar.current.date(byAdding: dateComponent, to: startDatePicker.date)!)
        }
    }
    


    
    
}

