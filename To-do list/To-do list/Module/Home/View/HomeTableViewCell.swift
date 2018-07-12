//
//  HomeTableViewCell.swift
//  To-do list
//
//  Created by Elaborapp on 12/07/18.
//  Copyright © 2018 ParanoidDev. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    static func register() -> UINib {
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
