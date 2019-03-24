//
//  SAUserDefault.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/24/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import Foundation
import SwiftyJSON

extension UserDefaults {
    
    subscript<T>(key: String) -> T? {
        get {
            return value(forKey: key) as? T
        }
        set {
            set(newValue, forKey: key)
        }
    }
}

class SAUserDefault {
    
    class var sharedInstance : SAUserDefault {
        struct Singleton {
            static let instance = SAUserDefault()
        }
        return Singleton.instance
    }
    
    
    var userName: String? {
        get {
            return UserDefaults.standard[#function] ?? ""
        }
        set {
            UserDefaults.standard[#function] = newValue
        }
    }
    
    var userEmail: String? {
        get {
            return UserDefaults.standard[#function] ?? ""
        }
        set {
            UserDefaults.standard[#function] = newValue
        }
    }
    
    var userPassword: String? {
        get {
            return UserDefaults.standard[#function] ?? ""
        }
        set {
            UserDefaults.standard[#function] = newValue
        }
    }
    
    func saveJobInLocal(_ jobModel  :  JobModel){
        
         var jobList  = [JobModel]()
        let previousJobModel = getAllJobFromLocal()
        if previousJobModel == nil || previousJobModel?.count == 0{
            jobList = previousJobModel!
        }
        jobList.append(jobModel)
       let Json =  jobList.toJSONString()
        
        let userDefaults = UserDefaults.standard
         do {
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: Json, requiringSecureCoding: false)
            userDefaults.set(encodedData, forKey: FJOB_KEY)
            userDefaults.synchronize()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func getAllJobFromLocal() -> [JobModel]?{
        
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.data(forKey: FJOB_KEY)
        if decoded == nil { return nil}
         let jobString =  NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! String
      
        var jobModel  =  [JobModel]()
        let data = jobString.data(using: .utf8)!
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
            {
                for json in jsonArray {
                    jobModel.append(JobModel(JSON: json)!)
                  }
            } else {
                print("bad json")
            }
        } catch let error as NSError {
            print(error)
            return nil
        }
 
        return (jobModel)
  
    }
    
    func isJobAlreadyApplied( _ jobModel : JobModel) -> Bool{
        let previousJobModel = getAllJobFromLocal()
        if previousJobModel == nil || previousJobModel?.count == 0{
            return false
         }
        
        return  previousJobModel?.contains(where: {$0.description == jobModel.description}) ?? false
        
     }
}

