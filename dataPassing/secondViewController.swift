//
//  secondViewController.swift
//  dataPassing
//
//  Created by Mohan K on 07/02/23.
//

import UIKit

protocol TextDelegate {
    func showcase(_ input: String?)
}

class secondViewController: UIViewController {
    
    
    var showLl : String = ""
    
    var delegate : TextDelegate!
    
    @IBOutlet weak var fieldText: UITextField!
    
    @IBOutlet weak var showLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        
        showLbl.text = showLl
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func backOnce(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("Test"), object: self, userInfo: ["name": "\(fieldText.text ?? "")"])
    }
    
}


extension secondViewController: ViewDelegate{
    func display(_ input: String?) {
        showLbl.text = input ?? ""
    }
}

extension secondViewController: EmailDelegate {
    func text(_ input: String?) {
        showLbl.text = input ?? ""
    }
}

//extension secondViewController: TextDelegate {
//    func showcase(_ input: String?) {
//        showLbl.text = input ?? ""
//    }
//    
//}
