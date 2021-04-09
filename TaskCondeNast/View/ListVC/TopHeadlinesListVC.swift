//
//  TopHeadlinesListVC.swift
//  TaskCondeNast
//
//  Created by Priyanka Saini on 06/04/21.
//

import UIKit

class TopHeadlinesListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let newsViewModel : ListViewModel = ListViewModel()
    var newsTableData : ListResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 145
        tableView.rowHeight = UITableView.automaticDimension
        
        DispatchQueue.global(qos: .utility).async {
            self.getNewsList()
        }
    }
    
    
    // Get the list from api..
    func getNewsList() {
        
        newsViewModel.getListDetails { (result) in
            self.newsTableData = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }

}
