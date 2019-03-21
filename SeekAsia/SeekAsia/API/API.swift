//
//  API.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/22/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import BoltsSwift

class API: NSObject {
    
    
    class var sharedInstance :API {
        struct Singleton {
            static let instance = API()
        }
        return Singleton.instance
    }
    
    
    
    func getAllJobs( ofPage page : Int) -> Task<AnyObject> {
        let taskSource : TaskCompletionSource<AnyObject> =  TaskCompletionSource.init()
        return taskSource.task


    }
    

}
