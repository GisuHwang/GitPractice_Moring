//
//  DetailSettingViewController.swift
//  CrazyPairPrograming
//
//  Created by 유하늘 on 2017. 6. 21..
//  Copyright © 2017년 유하늘. All rights reserved.
//

import UIKit

class DetailSettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ThirdTableViewCellDelegate {
    
    var rowTitle:String?
    var sectionTitle:String?
    

    func switchIsOnOff(sender: UISwitch) {
        switch rowTitle! {
        case "Wi-Fi":
            if sender.isOn {
                UserDefaults.standard.set("켬", forKey: "switch1")
                
            }else
            {
                UserDefaults.standard.set("끔", forKey: "switch1")
            }
        case "Bluetooth":
            if sender.isOn {
                UserDefaults.standard.set("켬", forKey: "switch2")
                
            }else
            {
                UserDefaults.standard.set("끔", forKey: "switch2")
            }
        case "개인용 핫스팟":
            if sender.isOn {
                UserDefaults.standard.set("켬", forKey: "switch3")
                
            }else
            {
                UserDefaults.standard.set("끔", forKey: "switch3")
            }
        default:
            return
        }
    }
    @IBOutlet weak var tv: UITableView!
    
    


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ThirdTableViewCell
        switch rowTitle! {
        case "Wi-Fi":
            if UserDefaults.standard.string(forKey: "switch1") == "켬" {
                cell.switchOutlet.isOn = true
                
            }else
            {
                cell.switchOutlet.isOn = false
            }
        case "Bluetooth":
            if UserDefaults.standard.string(forKey: "switch2") == "켬" {
                cell.switchOutlet.isOn = true
                
            }else
            {
                cell.switchOutlet.isOn = false
            }
        case "개인용 핫스팟":
            if UserDefaults.standard.string(forKey: "switch3") == "켬" {
                cell.switchOutlet.isOn = true
                
            }else
            {
                cell.switchOutlet.isOn = false
            }
        default:
            cell.switchOutlet.isHidden = true
        }
        
        
        cell.delegate = self
        
        cell.textLb.text = rowTitle!
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tv.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionTitle ?? ""
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
