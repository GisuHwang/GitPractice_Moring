//
//  ThirdTableViewCell.swift
//  CrazyPairPrograming
//
//  Created by 김태형 on 2017. 6. 21..
//  Copyright © 2017년 유하늘. All rights reserved.
//

import UIKit

protocol ThirdTableViewCellDelegate {
    func switchIsOnOff(sender: UISwitch)
}

class ThirdTableViewCell: UITableViewCell {

    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBOutlet weak var textLb: UILabel!
    
    var delegate:ThirdTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    @IBAction func switchTouched(_ sender: UISwitch) {
       
        delegate?.switchIsOnOff(sender: sender)
        
//        if sender.isOn {
//            UserDefaults.standard.set("켬", forKey: "switch")
//            
//        }else
//        {
//            UserDefaults.standard.set("끔", forKey: "switch")
//        }
        token = false
    }
}
