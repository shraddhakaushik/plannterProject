//
//  CourseViewController.swift
//  plannter
//
//  Created by Shraddha Kaushik on 2022-09-10.
//

import UIKit

class CourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var models:[(course: String, prof: String, locandtime: String, assignments: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapNew() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "course") as? AddCourseViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
        vc.completion = {course, prof, locandtime, assignments in
            self.navigationController?.popViewController(animated: true)
            self.models.append((course, prof, locandtime, assignments))
            self.label.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].course
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "newcourse")as? OpenCourseViewController else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.courseName = model.course
        vc.profName = model.prof
        vc.locandtimeName = model.locandtime
        vc.assignmentName = model.assignments
        navigationController?.pushViewController(vc, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
