//
//  SecondCustomTableViewCell.swift
//  CrazyPairPrograming
//
//  Created by 김태형 on 2017. 6. 21..
//  Copyright © 2017년 유하늘. All rights reserved.
//

import UIKit

protocol SecondCustomTableViewCellDelegate {
    func tvReload()
}

class SecondCustomTableViewCell: UITableViewCell {

    
    
    let cellularCon = CellularViewController()
    
    var delegate:SecondCustomTableViewCellDelegate?

    @IBAction func switchTouched(_ sender: UISwitch) {
        
       
        delegate?.tvReload()
        if sender.isOn {
            UserDefaults.standard.set(true, forKey: "switch5")
            
        }else
        {
            UserDefaults.standard.set(false, forKey: "switch5")
        }
        
    }
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var textLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
