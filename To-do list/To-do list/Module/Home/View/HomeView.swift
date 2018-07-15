//
//  ViewController.swift
//  To-do list
//
//  Created by Gustavo Alvarez on 11/07/18.
//  Copyright © 2018 ParanoidDev. All rights reserved.
//

import UIKit

class HomeView: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Mis tareas"
        
        self.tableView.register(HomeTableViewCell.register(), forCellReuseIdentifier: "HomeTableViewCell")
        self.tableView.estimatedRowHeight = 60
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getTasks()
        if (tasks.count > 0){
            hideEmptyView()
        }else{
            displayEmptyView()
        }
        self.tableView.reloadData()
    }
    
    func getTasks(){
        do {
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }
    
    func displayEmptyView(){
        emptyView.isHidden = false
    }
    func hideEmptyView(){
        emptyView.isHidden = true
    }
    
    @IBAction func newTask(_ sender: UIButton) {
        let vc:DetailsTableView = self.storyboard?.instantiateViewController(withIdentifier: "DetailsTableView") as! DetailsTableView
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func updateTask(sender: UIButton){
        print("updateTask: \(sender.tag)")
        if (tasks[sender.tag].isDone){
            tasks[sender.tag].isDone = false
        }else{
            tasks[sender.tag].isDone = true
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.tableView.reloadData()
    }
    
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        let row = indexPath.row
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: tasks[row].title!)
        
        if (tasks[row].isDone){
            
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.titleLabel.attributedText = attributeString
            cell.statusButton.setImage(UIImage(named: "check"), for: .normal)
            cell.statusButton.setImage(UIImage(named: "uncheck"), for: .highlighted)
        }else{
            cell.titleLabel.attributedText = attributeString
            cell.statusButton.setImage(UIImage(named: "uncheck"), for: .normal)
            cell.statusButton.setImage(UIImage(named: "check"), for: .highlighted)
        }
        
        cell.statusButton.tag = indexPath.row
        cell.statusButton.addTarget(self, action: #selector(self.updateTask), for: .touchUpInside)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc:DetailsTableView = self.storyboard?.instantiateViewController(withIdentifier: "DetailsTableView") as! DetailsTableView
        vc.isEditingTask = true
        vc.tasks = tasks
        vc.indexPath = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
