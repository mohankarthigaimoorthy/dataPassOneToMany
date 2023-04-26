//
//  firstViewController.swift
//  dataPassing
//
//  Created by Mohan K on 07/02/23.
//

import UIKit

//typealias textHandler = (String?) -> Void

protocol EmailDelegate {
    func  text(_ input: String?) 
}
class firstViewController: UIViewController {
   
    

    var lblTxt : String = ""
//    var textCompletion: textHandler? = nil

    var delegate: EmailDelegate!
    
    @IBOutlet weak var lblText: UILabel!
    
    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.NotificationAct(_:)), name: NSNotification.Name(rawValue: "Test"), object: nil)
        lblText.text = lblTxt
        // Do any additional setup after loading the view.
    }
    
    @objc func NotificationAct(_ notification: NSNotification) {
        if let userInfo = notification.userInfo {
           if let userName = userInfo["name"] as? String {
               print("name 1 : \(userName)")
               lblText.text = userName
            }
        }
    }
    
    @IBAction func gobackBtn(_ sender: Any) {
//        textCompletion?(firstTextField.text ?? "")
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as? secondViewController else {return}
        
        secondViewController.showLl = firstTextField.text ?? ""
        
        secondViewController.delegate = self
        navigationController?.pushViewController(secondViewController, animated: true)
        
        
    }
    
}

extension firstViewController: TextDelegate {
    func showcase(_ input: String?) {
        lblText.text = input ?? ""
    }
}


