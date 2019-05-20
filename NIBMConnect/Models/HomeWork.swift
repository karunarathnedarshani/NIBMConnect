//
//  File.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import UIKit

class HomeWork:Codable{
    
    var title:String
    var des:String
    
    init(title:String, des:String) {
        self.title = title
        self.des = des
    }
    
    public static func saveHomeWork(homeWork:HomeWork){
        var retrivedHomeWorkArray:[HomeWork] = []
        
        if  let homeWorkData = UserDefaults.standard.data(forKey: "homeworks"){
            retrivedHomeWorkArray = try! JSONDecoder().decode([HomeWork].self, from: homeWorkData)
        }
        
        
        if retrivedHomeWorkArray.count == 0 {
            
            var homeWorkArray = [HomeWork]()
            homeWorkArray.append(homeWork)
            let homeWorkDat = try! JSONEncoder().encode(homeWorkArray)
            UserDefaults.standard.set(homeWorkDat, forKey: "homeworks")
        }else{
            
            retrivedHomeWorkArray.append(homeWork)
            let homeWorkDat = try! JSONEncoder().encode(retrivedHomeWorkArray)
            UserDefaults.standard.set(homeWorkDat, forKey: "homeworks")
            
        }
        
        
    }
    
    public static func getHomeWork() -> [HomeWork]? {
        
        var homeWorkArray:[HomeWork] = []
        if let homeWorkData = UserDefaults.standard.data(forKey: "homeworks"){
            homeWorkArray = try! JSONDecoder().decode([HomeWork].self, from: homeWorkData)
        }
        return homeWorkArray
    }
    
    
}
