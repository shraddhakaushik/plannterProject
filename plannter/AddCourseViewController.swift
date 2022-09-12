//
//  AddCourseViewController.swift
//  plannter
//
//  Created by Shraddha Kaushik on 2022-09-11.
//

import UIKit

class AddCourseViewController: UIViewController {
    @IBOutlet var courseField: UITextField!
    @IBOutlet var profField: UITextField!
    @IBOutlet var locandtimeField: UITextField!
    @IBOutlet var assignmentsField: UITextView!
    
    public var completion: ((String, String, String, String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "S A V E", style: .done, target: self, action: #selector(didTapSave))
        
    }
    
    @objc func didTapSave() {
        if let text = courseField.text, !text.isEmpty {
            completion?(text, profField.text ?? "unknown", locandtimeField.text ?? "unknown", assignmentsField.text)
        }
    }
    

}
