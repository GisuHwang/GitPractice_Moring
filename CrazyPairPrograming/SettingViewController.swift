//
//  SettingViewController.swift
//  CrazyPairPrograming
//
//  Created by 유하늘 on 2017. 6. 21..
//  Copyright © 2017년 유하늘. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingCenter.settingData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let titleString = settingDataArray[indexPath.row].title
        let type = settingDataArray[indexPath.row].type
        let detailText = settingDataArray[indexPath.row].subtitle
        switch type {
        case .Basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
            cell.textLabel?.text = titleString
            
            return cell

        case .Detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            

            cell.textLabel?.text = titleString
            
            if titleString == "네트워크 사업자"
            {
                cell.detailTextLabel?.text = detailText
            }else
            {
                switch titleString {
                case "Wi-Fi":
                    cell.detailTextLabel?.text = UserDefaults.standard.string(forKey: "switch1")
                case "Bluetooth":
                    cell.detailTextLabel?.text = UserDefaults.standard.string(forKey: "switch2")
                case "개인용 핫스팟":
                    cell.detailTextLabel?.text = UserDefaults.standard.string(forKey: "switch3")
                default:
                    print("1")
                }
                
            }
            
            
            
            return cell
            
        case .Switch:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! CustomTableViewCell
            cell.cellTextLabel.text = titleString
            
            cell.switchOutlet.isOn = UserDefaults.standard.bool(forKey: "switch4")

            
            
            return cell
        }
        
    }
    
    @IBOutlet weak var tv: UITableView!
    var settingDataArray:Array<SettingCenter> = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set("켬", forKey: "switch1")
        UserDefaults.standard.set("켬", forKey: "switch2")
        UserDefaults.standard.set("켬", forKey: "switch3")
        
        
        for item in SettingCenter.settingData
        {
          


            let a = SettingCenter(with: item as! [String : String])
           
            settingDataArray.append(a)
            
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tv.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
//        let vIndexPath = tv.indexPath(for: cell)
        
        if segue.identifier == "detailtohotspot"
        {
            let detailSettingViewController = segue.destination as! DetailSettingViewController
            
            detailSettingViewController.rowTitle = cell.textLabel?.text
            
            
        }
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
