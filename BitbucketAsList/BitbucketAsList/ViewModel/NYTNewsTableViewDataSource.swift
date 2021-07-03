//
//  NYTNewsTableViewDataSource.swift
//  NYTimesHeadlines
//
//  Created by Samrez Ikram on 02/07/2021.
//

import Foundation
import UIKit

class NYTNewsTableViewDataSource<CELL : RepositoryTableViewCell, Values> : NSObject, UITableViewDataSource {
    
    //Table View
    private var cellIdentifier : String!
    private var items : [Values]!
    var configureCell : (CELL, Values) -> () = {_,_ in }
    //Table View

    //Search controller
    var filteredTableData = [Values]()
    var resultSearchController = UISearchController()
    //Search controller

    
    init(cellIdentifier : String, items : [Values], configureCell : @escaping (CELL, Values) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(self.resultSearchController.isActive) {
            return self.filteredTableData.count;
        } else {
            return items.count

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        if (resultSearchController.isActive) {
            let item = self.filteredTableData[indexPath.row]
            self.configureCell(cell, item)
            return cell
          }
        else {
            let item = self.items[indexPath.row]
            self.configureCell(cell, item)
            return cell
        }
    }
    
    
}
