//
//  SAJobListViewController.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/23/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import UIKit

class SAJobListViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!

    //MARK: Variables
    var presenter:  jobPresentor!
     var jobResult : [JobModel]?{
        didSet{
            self.tableView.reloadData()
        }
    }

    //MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        initialzePresentor()
        // Do any additional setup after loading the view.
    }
    
    func initialzePresentor() {
        presenter =    jobPresentor(view: self)
        presenter.getAllJobsList()
    }
    
}

//MARK: TableView Delegate


extension SAJobListViewController : UITableViewDelegate , UITableViewDataSource {
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


extension  SAJobListViewController : JobListView {
    func didGetJobsListSuccessed(withResult result: [JobModel]) {
        jobResult = result
 
    }
    
    func didGetProductFailed(witError error: String) {
        
    }
    
    
}

