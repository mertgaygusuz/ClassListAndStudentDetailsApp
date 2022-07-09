//
//  ViewController.swift
//  ClassListApplication
//
//  Created by Mert Gaygusuz on 9.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var lblStudentName: UILabel!
    
    @IBOutlet weak var lblStudentNumber: UILabel!
    
    var student : Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let name = student?.name ?? "Bilinmiyor"
        let studentNumber = student?.studentNumber ?? -1
        
        lblStudentName.text = name
        lblStudentNumber.text = "\(studentNumber)"
    }

}

