//
//  ViewController.swift
//  To-do list
//
//  Created by Gustavo Alvarez on 11/07/18.
//  Copyright © 2018 ParanoidDev. All rights reserved.
//

import UIKit

class HomeView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    lazy var tasksModel = { () -> [Tasks] in
        if (Tasks().getAllTasks().count == 0){
            displayEmptyView()
        }
        return Tasks().getAllTasks()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Mis tareas"
        
        self.tableView.register(HomeTableViewCell.register(), forCellReuseIdentifier: "HomeTableViewCell")
        self.tableView.estimatedRowHeight = 60
        //self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
    }
    
    func displayEmptyView(){
        emptyView.isHidden = false
    }
    
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasksModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        let row = indexPath.row
        
        cell.titleLabel.text = tasksModel[row].title
        if (tasksModel[row].isDone){
            cell.statusButton.setImage(UIImage(named: "check"), for: .normal)
            cell.statusButton.setImage(UIImage(named: "uncheck"), for: .highlighted)
        }else{
            cell.statusButton.setImage(UIImage(named: "uncheck"), for: .normal)
            cell.statusButton.setImage(UIImage(named: "check"), for: .highlighted)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let detail = DetailPostViewController()
        //detail.getValue = self.postViewModel.postPressed(at: indexPath)
        //self.pushNavigation(detail)
    }
    
    
}
