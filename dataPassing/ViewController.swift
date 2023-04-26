//
//  ViewController.swift
//  dataPassing
//
//  Created by Mohan K on 07/02/23.
//

import UIKit

protocol ViewDelegate {
    func display(_ input: String?)
    
}
class ViewController: UIViewController {
    
    @IBOutlet weak var textLbl: UILabel!
    
    @IBOutlet weak var textFieldOne: UITextField!
    
    var textLl : String = ""
    
    var delegate : ViewDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        NotificationCenter.default.addObserver(self, selector: #selector(self.NotificationAct(_:)), name: NSNotification.Name(rawValue: "Test"), object: nil)
        
        
    }
    
    @objc func NotificationAct(_ notification: NSNotification) {
        if let userInfo = notification.userInfo {
           if let userName = userInfo["name"] as? String {
                print("name : \(userName)")
                textLbl.text = userName
            }
        }
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        
        guard let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "firstViewController") as? firstViewController else {return}
        firstViewController.lblTxt = textFieldOne.text ?? ""
        //        firstViewController.textCompletion = {
        //            newValue in self.textFieldOne.text = newValue
        //        }
        firstViewController.delegate = self
        navigationController?.pushViewController(firstViewController, animated: true)
        
        
    }
    
}
    
    
    

extension ViewController:  EmailDelegate {
    func  text(_ input: String?)  {
        textLbl.text  = input ?? ""
       
    }
}

extension ViewController: TextDelegate {
    func showcase(_ input: String?) {
        textLbl.text = input ??  ""
    }
}
