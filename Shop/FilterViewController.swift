//
//  FilterViewController.swift
//  Shop
//
//  Created by Pragathi Kallu on 9/26/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit
import SAPFiori

protocol FilterViewControllerDelegate: class {
    func filterViewController(_ viewController: FilterViewController, didUpdate model: FilterModel)
}

class FilterViewController: FUIFormTableViewController {

    weak var delegate: FilterViewControllerDelegate?
    var model = FilterModel()
    
    let sectionSpacing: CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredContentSize = CGSize(width: 400, height: 580)
        
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.register(FUIFilterFormCell.self, forCellReuseIdentifier: FUIFilterFormCell.reuseIdentifier)
        tableView.register(FUIButtonFormCell.self, forCellReuseIdentifier: FUIButtonFormCell.reuseIdentifier)
    }
    
    /// reset the filter
    func resetFilter() {
        
        // make sure to retain this setting that we don't own in the filter popup
        let previousSearchText = model.searchText
        
        // create a new filter model with all values set to inital
        model = FilterModel()
        
        // assign the previous search text
        model.searchText = previousSearchText
        
        // reload display of the filter
        tableView.reloadData()
    }

    @IBAction func applyFilter(_ sender: Any) {
        // inform delegate about changed model
        delegate?.filterViewController(self, didUpdate: model)
        dismiss(animated: true)

    }
    
    @IBAction func cancelFilter(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /// Returns the number of filter/sorter/group options.
    /// There is one section per option.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // each filter/sorter is in its own section
        return QueryType.count
    }
    
    /// the number of rows which are displayed in a concrete filter/group/sort section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    /// get the height for the header in the section
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        // no header space above the first filter/sorter
        return section == 0 ? 0 : sectionSpacing
    }
    
    /// Get the concrete filter/sort/group cell inside the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        
        let queryType = QueryType(rawValue: section)!
        
        switch queryType {
        case .sortBy:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: FUIFilterFormCell.reuseIdentifier, for: indexPath) as! FUIFilterFormCell
            
            cell.allowsMultipleSelection = model.sortItemGroup.allowsMultipleSelection
            cell.allowsEmptySelection = model.sortItemGroup.allowsEmptySelection
            cell.valueOptions = model.sortItemGroup.labels
            cell.value = model.selectedSortItemIndices
            cell.keyName = model.sortItemGroup.title
            cell.onChangeHandler = { [unowned self] newValues in
                self.model.selectedSortItemIndices = newValues
            }
            
            return cell
            
        case .reset:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: FUIButtonFormCell.reuseIdentifier, for: indexPath) as! FUIButtonFormCell
            
            cell.button.setTitle("Reset All", for: .normal)
            cell.tintColor = .preferredFioriColor(forStyle: .tintColorDark)
            cell.alignment = .center
            cell.onChangeHandler = { [unowned self] actionTriggered in
                if actionTriggered == .primaryActionTriggered {
                    self.resetFilter()
                }
            }
            return cell
        }
    }
}
