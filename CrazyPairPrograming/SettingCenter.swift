//
//  SettingCenter.swift
//  CrazyPairPrograming
//
//  Created by 유하늘 on 2017. 6. 21..
//  Copyright © 2017년 유하늘. All rights reserved.
//

import Foundation


enum CellType:String {
    case Basic = "basicCell"
    case Detail = "detailCell"
    case Switch = "switchCell"
}


var token:Bool = true

struct SettingCenter {
    
    
    
    var title:String
    var type:CellType
    var subtitle:String
    
    
    init(with dictionary:[String:String]) {
        
        
        
        self.title = dictionary["rowTitle"]!
        self.type = CellType(rawValue: dictionary["cellType"]!)!
        self.subtitle = dictionary["rowSubtitle"]!
        
    }
    
    
    static var settingData:[Any]{
        let path = Bundle.main.path(forResource: "SettingDataCenter", ofType: "plist")
        
        let settingArray = NSArray(contentsOfFile: path!) as! [[String:String]]
        return settingArray
        
    }

    
    
}

struct CellularCenter {
    
    var dataArray:[[String:String]]
    var sectionTitle:String
//    var rowTitle:String
//    var type:CellType
//    var subtitle:String
    
    
    init(with dictionary:[String:Any]) {
        
        sectionTitle = dictionary["sectiontitle"] as! String
        dataArray = dictionary["data"] as! [[String : String]]
        
//        rowTitle = realData["rowTitle"]!
//        type = CellType(rawValue: realData["cellType"]!)!
//        subtitle = realData["rowSubtitle"]!
        
        
        
//        dataArray = dictionary["data"] as! [[String : String]]
        sectionTitle = dictionary["sectiontitle"] as! String
        
        
        
        
//        self.title = dictionary["rowTitle"] ?? ""
//        self.type = CellType(rawValue: "cellType") ?? .Basic
//        self.subtitle = dictionary["rowSubtitle"] ?? ""
        
    }
    
    
    
    static var cellularData:[Any]{
        let path = Bundle.main.path(forResource: "CellularDataCenter", ofType: "plist")
        
        let settingArray = NSArray(contentsOfFile: path!) as! [[String:Any]]
        return settingArray
    }

    
    
}
