//
//  OpenCourseViewController.swift
//  plannter
//
//  Created by Shraddha Kaushik on 2022-09-11.
//

import UIKit

class OpenCourseViewController: UIViewController {
    
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var profLabel: UILabel!
    @IBOutlet var locandtimeLabel: UILabel!
    @IBOutlet var assignmentLabel: UITextView!
    
    public var courseName: String = ""
    public var profName: String = ""
    public var locandtimeName: String = ""
    public var assignmentName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseLabel.text = courseName
        profLabel.text = profName
        locandtimeLabel.text = locandtimeName
        assignmentLabel.text = assignmentName
        // Do any additional setup after loading the view.
    }
    


}
