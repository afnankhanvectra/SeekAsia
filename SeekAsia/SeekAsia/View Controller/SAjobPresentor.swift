//
//  SAjobPresentor.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/23/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import Foundation
import BoltsSwift

class jobPresentor : NSObject {
    
    unowned let jobListView: JobListView
    
    required init(view: JobListView){
        jobListView = view
    }
    
    func getAllJobsList()  {
        
        
        API.sharedInstance.getAllJobs().continueWith { [weak self]  task in
            if task.error != nil {
                self?.jobListView.didGetProductFailed(witError: task.error.debugDescription)
            } else {
                self?.jobListView.didGetJobsListSuccessed(withResult: task.result as! [JobModel])
            }
        }
        
    }
    
}
