//
//  RepositoryVC.swift
//  BitbucketAsList
//
//  Created by Samrez Ikram on 03/07/2021.
//

import UIKit
class RepositoryVC: UIViewController, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
    
        self.dataSource.filteredTableData.removeAll(keepingCapacity: false)
        
        guard let searchText = searchController.searchBar.text else {
              return
        }

        let array = self.nytNewsViewModel.publicRepositories.values.filter {
            return $0.owner?.display_name?.lowercased().range(of: searchText.lowercased()) != nil
        }

        self.dataSource.filteredTableData = array

        self.repositoryTableView.reloadData()
    }
    
    
    @IBOutlet weak var repositoryTableView: UITableView!
    
    private var nytNewsViewModel : RepositoryViewModel!
    
    private var dataSource : RepositoryTableViewDataSource<RepositoriesTableViewCell, Values>!
    

    //------------------------------------------------------
    
    // Adds Optional Refreshing Control
    /*lazy var refreshControl: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
        refreshControl.transform = CGAffineTransform(scaleX: 0.87, y: 0.87)
        return refreshControl
    }()*/

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "RepositoriesTableViewCell", bundle: nil)
        self.repositoryTableView.register(nib, forCellReuseIdentifier: "RepositoriesTableViewCell")
        self.repositoryTableView.rowHeight = 120

        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        
        self.nytNewsViewModel =  RepositoryViewModel()
        self.nytNewsViewModel.bindnytNewsViewModelToController = {
            DispatchQueue.main.async {
                self.updateDataSource()
                self.updateSearch()
            }
        }
    }
    
    func updateDataSource(){
        self.dataSource = RepositoryTableViewDataSource(cellIdentifier: "RepositoriesTableViewCell", items: self.nytNewsViewModel.publicRepositories.values, configureCell: { (cell, repository) in
            cell.repositoriesOwnerTitleLabel.text = repository.owner?.display_name
            cell.repositoriesOwnerTypeLabel.text = repository.owner?.type
            cell.repositoriesCreationDdate.text = repository.created_on
        })
        
        
        
        DispatchQueue.main.async {
            self.repositoryTableView.dataSource = self.dataSource
            self.repositoryTableView.reloadData()
//            self.refreshControl.endRefreshing()
        }
    }
    
    func updateSearch () {
        self.dataSource.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.searchBar.sizeToFit()

            DispatchQueue.main.async {
                self.repositoryTableView.tableHeaderView = controller.searchBar
                controller.hidesNavigationBarDuringPresentation = true;
                controller.searchBar.searchBarStyle = UISearchBar.Style.minimal;

            }
            return controller
            })()
    }
    
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        callToViewModelForUIUpdate()
    }
}

// Adds Optional Refreshing Control
/*extension ViewController {
    func addRefreshControl(to tableView: UITableView) {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }

        tableView.indicatorStyle = .black
    }
}*/
