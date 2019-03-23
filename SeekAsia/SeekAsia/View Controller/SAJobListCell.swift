//
//  SAJobListCell.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/23/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import UIKit

class SAJobListCell: UITableViewCell {

    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var jobLocationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(withData jobModel : JobModel){
        jobTitleLabel.text =    jobModel.jobTitle
        jobLocationLabel.text = jobModel.location

    }
}
