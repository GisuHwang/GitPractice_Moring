//
//  CellularViewController.swift
//  CrazyPairPrograming
//
//  Created by 유하늘 on 2017. 6. 21..
//  Copyright © 2017년 유하늘. All rights reserved.
//

import UIKit



class CellularViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SecondCustomTableViewCellDelegate{
    
    @IBOutlet weak var tv: UITableView!
    
    
    func tvReload()
    {
        tv.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        let cellularArray = cellularDataArray[indexPath.section].dataArray
        let cellData = cellularArray[indexPath.row] 
        let cellType = CellType(rawValue: cellData["cellType"]!)!
        let rowTitle = cellData["rowTitle"]
        let subTitle = cellData["rowSubtitle"]
        
        
        
        switch cellType {
        case .Basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
            cell.textLabel?.text = rowTitle
            cell.detailTextLabel?.text = UserDefaults.standard.string(forKey: "switch3")
            
            
            return cell
        case .Detail:
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            
//            let cell2 = tableView.dequeueReusableCell(withIdentifier: "switchCell") as! SecondCustomTableViewCell
//            cell2.delegate = self
            cell.textLabel?.text = rowTitle
            
            if cell.textLabel?.text == "셀룰러 데이터 옵션"
            {
                switch UserDefaults.standard.bool(forKey: "switch5") {
                case true:
                    cell.detailTextLabel?.text = "로밍 켬"
                default:
                    cell.detailTextLabel?.text = "로밍 끔"
                }
            }else{
                
                cell.detailTextLabel?.text = subTitle
            }

            
            return cell
        case .Switch:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SecondCustomTableViewCell
            cell.delegate = self
            cell.switchOutlet.isOn = UserDefaults.standard.bool(forKey: "switch5")
            cell.textLb.text = rowTitle
            cell.detailTextLabel?.text = subTitle
            
            
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        let a = CellularCenter.cellularData[section] as! [String:Any]
        let b = a["data"] as! [[String:String]]
        return b.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return CellularCenter.cellularData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let a = CellularCenter.cellularData[section] as! [String:Any]
        
        
        let a = CellularCenter.cellularData[section] as! [String:Any]
        return a["sectiontitle"] as? String
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tv.reloadData()
    }
    
    var cellularDataArray:[CellularCenter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.set(true, forKey: "switch5")
        for item in CellularCenter.cellularData
        {
            
            
            
            let a = CellularCenter(with: item as! [String : Any])
            
            cellularDataArray.append(a)
            
        }

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        
        
        let detailSettingViewController = segue.destination as! DetailSettingViewController
        
        detailSettingViewController.rowTitle = cell.textLabel?.text
        
        
        
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
