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
    
    var isEditingTask = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "trash"), style: .done, target: self, action: #selector(self.deleteTask))
        //rightBarButtonItem.tintColor = UIColor(red: 255, green: 99, blue: 71, alpha: 1.0)
        
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 255.0/255.0, green: 99.0/255, blue: 71.0/255, alpha: 1.0)
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        if (!(titleTask.text?.isEmpty)!){
            let newTask = Tasks(title: titleTask.text, details: detailsTask.text, subTasks: nil, created: Date(), isDone: false)
            
            Constants.allTasks.append(newTask)
        }
    }
    
    @objc func deleteTask(){
        
    }
    
    

}
