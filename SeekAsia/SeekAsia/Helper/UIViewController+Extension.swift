//
//  UIViewController+Extension.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/24/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import UIKit


extension UIViewController {

    func JobListViewController() -> UIViewController {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        return  (story.instantiateViewController(withIdentifier: "SAJobListViewController"))
    }
    
    func JobDetialViewController() -> UIViewController {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        return  (story.instantiateViewController(withIdentifier: "SAJobDetialViewController"))
    }
    
    func JobHistoryViewController() -> UIViewController {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        return  (story.instantiateViewController(withIdentifier: "SAJobHistoryViewController"))
    }
    
    
    
    
}
