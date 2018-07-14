//
//  DetailsTableView.swift
//  To-do list
//
//  Created by Elaborapp on 12/07/18.
//  Copyright © 2018 ParanoidDev. All rights reserved.
//

import UIKit

class DetailsTableView: UITableViewController {

    @IBOutlet weak var titleTask: UITextField!
    @IBOutlet weak var detailsTask: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tasks: [Task] = []
    var indexPath = 0
    
    var isEditingTask = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isEditingTask{
            let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "trash"), style: .done, target: self, action: #selector(self.deleteTask))
            self.navigationItem.rightBarButtonItem = rightBarButtonItem
            self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 196.0/255.0, green: 196.0/255, blue: 196.0/255, alpha: 1.0)
            
            fillTask()
        }
    }
    
    func fillTask(){
        titleTask.text = tasks[indexPath].title
        detailsTask.text = tasks[indexPath].details
    }

    override func viewDidDisappear(_ animated: Bool) {
        if isEditingTask{
            tasks[indexPath].title = titleTask.text!
            tasks[indexPath].details = detailsTask.text!
        }else{
            if (!(titleTask.text?.isEmpty)!){
                
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let task = Task(context: context) // Link Task & Context
                task.title = titleTask.text!
                task.details = detailsTask.text!
                task.isDone = false
                // Save the data to coredata
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
        }
    }
    
    @objc func deleteTask(){
        context.delete(tasks[indexPath])
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
