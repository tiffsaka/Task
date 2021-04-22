//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Tiffany Sakaguchi on 4/21/21.
//

import UIKit

//MARK: - Protocol
protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    weak var delegate: TaskCompletionDelegate?
    
    var task: Task? {
        didSet {                        //look up properties
            updateViews()
        }
    }
 
    @IBAction func completionButtonTapped(_ sender: Any) {
        delegate?.taskCellButtonTapped(self)
    }
    
    func updateViews() {
        
        guard let task = task else { return }
        
        taskNameLabel.text = task.name
        
        if task.isComplete {
            completionButton.setBackgroundImage(UIImage(named: "complete"), for: .normal)
        } else {
            completionButton.setBackgroundImage(UIImage(named: "incomplete"), for: .normal)
        }
    }

}//End of class
