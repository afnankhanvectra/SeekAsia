//
//  Jobs.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/22/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import Foundation
import ObjectMapper

class JobModel : Mappable {
    
    var id: Int = -1
    
    var jobTitle:     String = ""
    var location:     String = ""
    var description:     String = ""

    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        
        id    <- map[FID]
        
        jobTitle    <- map[FJOB_TITLE]
        location    <- map[FLOCATION]
        description    <- map[FDESCRIPTION]

    }
}



