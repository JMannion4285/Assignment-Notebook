//
//  ViewController.swift
//  Assignment Notebook
//
//  Created by period2 on 3/29/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewCell: UITableView!
    var assignments = ["Example Assignment", "Read", "Lab"]
    var classes = ["Example Class", "English", "Science"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Assignments")
        cell?.textLabel?.text = assignments[indexPath.row]
        cell?.detailTextLabel?.text = classes[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        func alert() {
            let optionAlert = UIAlertController(title: "Choose An Option", message: "", preferredStyle: .alert)
            let complete = UIAlertAction(title: "Mark As Done", style: .default) { (action) in
                tableView.cellForRow(at: indexPath)?.backgroundColor = .green
            }
            let delete = UIAlertAction(title: "Delete", style: .default) { (action) in
                self.assignments.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            optionAlert.addAction(complete)
            optionAlert.addAction(delete)
            optionAlert.addAction(cancel)
            present(optionAlert, animated: true, completion: nil)
        }
        alert()
    }
    
    @IBAction func whenPlusPressed(_ sender: Any) {
        func addAlert() {
            let addAlert = UIAlertController(title: "Add An Assignment", message: "And A Class", preferredStyle: .alert)
            addAlert.addTextField { (assignmentTextField) in
                addAlert.addTextField { (classTextField) in
                    assignmentTextField.placeholder = "Assignment"
                    classTextField.placeholder = "Class"
                    let assignment = assignmentTextField.text
                    let classess = classTextField.text
                    let submit = UIAlertAction(title: "Enter", style: .default) { (Action) in
                        self.assignments.append(assignment!)
                        self.classes.append(classess!)
                        self.tableViewCell.reloadData()
                    }
                    addAlert.addAction(submit)
                }
            }
            present(addAlert, animated: true, completion: nil)
        }
        addAlert()
    }
}
