//
//  SAJobDetialViewController.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/23/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import UIKit

class SAJobDetialViewController: UIViewController {
    
    @IBOutlet weak var jobTitleLabel:   UILabel!
    @IBOutlet weak var jobLocationLabel:   UILabel!
    @IBOutlet weak var jobDescriptionLabel:   UILabel!
    @IBOutlet weak var applyJobButton:    UIButton!


    var jobModel : JobModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    
    func configureView(){
        jobTitleLabel.text =        jobModel.jobTitle
        jobLocationLabel.text =     jobModel.location
        jobDescriptionLabel.text =  jobModel.description

        applyJobButton.isHidden = SAUserDefault.sharedInstance.isJobAlreadyApplied(jobModel)
    }
    
    @IBAction func applyJobButtonClicked(_ sender: UIButton) {
        
        SAUserDefault.sharedInstance.saveJobInLocal(jobModel)
    }
    
    
}
