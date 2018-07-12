//
//  Tasks.swift
//  To-do list
//
//  Created by Elaborapp on 12/07/18.
//  Copyright © 2018 ParanoidDev. All rights reserved.
//

import Foundation

struct Tasks {
    
    var title: String?
    var details: String?
    var subTasks: [Tasks]?
    var created: Date?
    var isDone: Bool = false
    
    func getAllTasks()-> [Tasks]{
        
        /*var myTasks = [Tasks]()
        
        let task1 = Tasks(title: "Comer bien", details: "Praesent commodo cursus magna, vel scelerisque nisl consectetur et.", subTasks: nil, created: Date(), isDone: false)
        myTasks.append(task1)
        
        let task2 = Tasks(title: "Condimentum Egestas Tellus Consectetur Adipiscing", details: "Maecenas sed diam eget risus varius blandit sit amet non magna.", subTasks: nil, created: Date(), isDone: false)
        myTasks.append(task2)
        
        let task3 = Tasks(title: "Egestas Cras", details: nil, subTasks: nil, created: Date(), isDone: true)
        myTasks.append(task3)*/
        
        //myTasks.removeAll()
        print("Constants.allTasks: \(Constants.allTasks.count)")
        return Constants.allTasks
    }
}
