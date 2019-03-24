//
//  SAUserDefault.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/24/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import Foundation
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
        
        if getJobFromLocal() != nil {
            jobList = getJobFromLocal()!
        }
        jobList.append(jobModel)
        
        let userDefaults = UserDefaults.standard
         do {
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: jobModel, requiringSecureCoding: false)
            userDefaults.set(encodedData, forKey: FJOB_KEY)
            userDefaults.synchronize()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func getJobFromLocal() -> [JobModel]?{
        
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.data(forKey: FJOB_KEY)
        if decoded == nil { return nil}
         return  NSKeyedUnarchiver.unarchiveObject(with: decoded!) as? [JobModel]
 

    }
}

