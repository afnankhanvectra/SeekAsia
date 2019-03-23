//
//  SAjobView.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/23/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import Foundation

protocol JobListView  : class{
    
    func didGetJobsListSuccessed (withResult result : [JobModel])
    func didGetProductFailed (witError error : String)
    
}

//Job View protocol Extension
extension JobListView {
    
    func didGetJobsListSuccessed (withResult result : [JobModel]){ }
    func didGetProductFailed (witError error : String){ }
    
}
