//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Tiffany Sakaguchi on 4/21/21.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextField: UITextField!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    var task: Task?
    //var date: Date?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty,
              let notes = taskNotesTextField.text, !notes.isEmpty else { return }
       
        let date = taskDueDatePicker.date
        
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, dueDate: date)
        } else {
            TaskController.sharedInstance.createTaskWith(name: name, notes: notes, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    //This function is not needed
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        //date = taskDueDatePicker.date
    }
    
    func updateViews() {
        guard let task = task else { return }
        taskNameTextField.text = task.name
        taskNotesTextField.text = task.notes
        taskDueDatePicker.date = task.dueDate
    }
    
}//End of class
