//
//  ViewController.swift
//  Exam
//
//  Created by R90 on 14/10/24.
//




import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var numberText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendBtnCliked(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "displayViewController") as? displayViewController {
            if let text = numberText.text, let number = Int(text), number > 0 {
                vc.texts = Array(1...number).map { String($0) }
            }
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            print("Could not instantiate displayViewController.")
        }
    }
}
