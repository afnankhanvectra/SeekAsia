//
//  SALoginViewController.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/22/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import UIKit

class SALoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        API.sharedInstance.getAllJobs()
        // Do any additional setup after loading the view.
    }
    

    

}
