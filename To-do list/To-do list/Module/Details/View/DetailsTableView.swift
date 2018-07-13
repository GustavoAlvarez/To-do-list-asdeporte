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
    
    var Defaults = UserDefaults.standard
    
    var isEditingTask = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "trash"), style: .done, target: self, action: #selector(self.deleteTask))
        //rightBarButtonItem.tintColor = UIColor(red: 255, green: 99, blue: 71, alpha: 1.0)
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 196.0/255.0, green: 196.0/255, blue: 196.0/255, alpha: 1.0)
        
        /*let decoded  = Defaults.object(forKey: "MyTasks") as? Data
        if (decoded != nil){
        let myTasks = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! [Tasks]
            print("myTasks: \(myTasks)")
            print("myTasks count: \(myTasks.count)")
        }*/
    }

    override func viewDidDisappear(_ animated: Bool) {
        if (!(titleTask.text?.isEmpty)!){
            let newTask = Tasks(title: titleTask.text, details: detailsTask.text, subTasks: nil, created: Date(), isDone: false)
            
            Constants.allTasks.append(newTask)
            
           /* let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: Constants.allTasks)
            Defaults.set(encodedData, forKey: "MyTasks")
            Defaults.synchronize()*/
        }
    }
    
    @objc func deleteTask(){
        
    }
    
    

}
