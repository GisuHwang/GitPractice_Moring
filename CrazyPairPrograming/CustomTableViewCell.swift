//
//  CustomTableViewCell.swift
//  CrazyPairPrograming
//
//  Created by 유하늘 on 2017. 6. 21..
//  Copyright © 2017년 유하늘. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    

//    @IBOutlet var textLabel: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var cellTextLabel: UILabel!
    
    @IBAction func switchTouched(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaults.standard.set(true, forKey: "switch4")
            
        }else
        {
            UserDefaults.standard.set(false, forKey: "switch4")
        }
        
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
