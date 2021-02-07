//
//  HomeViewController.swift
//  idunno
//
//  Created by Felicia Lo on 1/23/21.
//  Copyright © 2021 Felicia Lo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var findEndDate: UIButton!
    
    @IBOutlet weak var findDays: UIButton!
    
  
    
    @IBAction func tapFindEndDate(){
        present(ViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    


    

}
