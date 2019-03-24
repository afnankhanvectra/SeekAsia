//
//  SAJobHistoryViewController.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/23/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import UIKit

class SAJobHistoryViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var jobResult : [JobModel]?{
        didSet{
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       jobResult =  SAUserDefault.sharedInstance.getAllJobFromLocal()
        // Do any additional setup after loading the view.
    }
 

    
}



//MARK: TableView Delegate


extension SAJobHistoryViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SAJobListCell") as! SAJobListCell
        cell.configureCell(withData: jobResult![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let jobDetialViewController = JobDetialViewController() as! SAJobDetialViewController
        jobDetialViewController.jobModel = jobResult![indexPath.row]
        self.navigationController?.pushViewController(jobDetialViewController, animated: true)
    }
    
}
