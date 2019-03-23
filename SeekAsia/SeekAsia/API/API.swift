//
//  API.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/22/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import Foundation
import Alamofire
import BoltsSwift
import SwiftyJSON


class API: NSObject {
    
    
    class var sharedInstance :API {
        struct Singleton {
            static let instance = API()
        }
        return Singleton.instance
    }
    
    
    func getAllJobs() -> Task<AnyObject> {
        let taskSource : TaskCompletionSource<AnyObject> =  TaskCompletionSource.init()
        
        Alamofire.request(jobURL, method: .get, parameters: nil, encoding: URLEncoding.default).responseData { [weak self] response in
            if response.result.isSuccess && response.result.value != nil {
                
                let swiftyJsonVar = JSON(response.result.value!)
                let error = self?.checkForError(inJson: swiftyJsonVar)
                if  error != nil { taskSource.set(error: error!)
                    return
                }
                
                var jobsArray  =  [JobModel]()
                
                 for (_ ,jobJson):(String, JSON) in swiftyJsonVar {
                    let jobObject = JobModel(JSONString: jobJson.rawString()!)
                    jobsArray.append(jobObject!)
                 }
                
                taskSource.set(result: jobsArray as AnyObject)
                
            } else { taskSource.set(result: false as AnyObject)}
            
        }
        
        return taskSource.task
        
    }
    
    
    func checkForError(inJson jobJson : JSON) -> Error? {
        let successKey = jobJson[FSUCCESS_KEY].stringValue
        
        if successKey == "0"  {let errorString =  jobJson["error"][0].stringValue
            return createError(withDescrption: errorString, andErrorCode: GENERAL_CODE_ERROR)
        }
        return nil
    }
    
    
    
}

 
// Error
func  createError(withDescrption descrption :  String , andErrorCode code :  Int) -> NSError {
    let bundleID = Bundle.main.bundleIdentifier
    var userInfo   =  [String : Any]();
    userInfo[NSLocalizedDescriptionKey] = descrption
    return  NSError(domain:bundleID!, code:code, userInfo:userInfo)
}




