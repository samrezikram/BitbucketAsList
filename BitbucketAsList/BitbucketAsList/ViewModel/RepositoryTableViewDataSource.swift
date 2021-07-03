//
//  RepositoryTableViewDataSource.swift
//  BitbucketAsList
//
//  Created by Samrez Ikram on 03/07/2021.


import Foundation
import UIKit

class RepositoryTableViewDataSource<CELL : RepositoriesTableViewCell, Values> : NSObject, UITableViewDataSource {
    
    //--Start Table View--------------------------------------------------------------------------
    private var cellIdentifier : String!
    private var items : [Values]!
    var configureCell : (CELL, Values) -> () = {_,_ in }
    //--End Table View----------------------------------------------------------------------------

    //--Start Search controller-------------------------------------------------------------------
    var filteredTableData = [Values]()
    var resultSearchController = UISearchController()
    //--End Search controller---------------------------------------------------------------------

    //--initialize TableViewCell------------------------------------------------------------------
    init(cellIdentifier : String, items : [Values], configureCell : @escaping (CELL, Values) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    //--initialize TableViewCell------------------------------------------------------------------
    
    //-- TableView DataSource Protocol Methods----------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(self.resultSearchController.isActive) {
            return self.filteredTableData.count;
        } else {
            return items.count

        }
    }
    //---------------------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        if (resultSearchController.isActive) { // If Search Controller is active
            let item = self.filteredTableData[indexPath.row] as Values
            self.configureCell(cell, item)
            cell.layoutSubviews()
            return cell
          }
        else { // Loading Content of List
            let item = self.items[indexPath.row] as Values
            self.configureCell(cell, item)
            cell.layoutSubviews()
            return cell
        }
    }
    //--End TableView DataSource Protocol Methods--------------------------------------------------
}
