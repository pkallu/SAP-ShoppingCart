//
//  ViewController.swift
//  Shop
//
//  Copyright © 2017 SAP SE or an SAP affiliate company. All rights reserved.
//  Use of this software subject to the End User License Agreement located in ../EULA.pdf
//

import UIKit
import SAPCommon
import SAPFiori
import SAPOData

class ProductListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let logger = Logger.shared(named: "ProductListViewController");
    fileprivate var products = [Product]()

    let objectCellId = "ProductCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func loadProducts() {
        // Select properties to load
        var query = DataQuery().select(Product.id,
                                       Product.name,
                                       Product.description,
                                       Product.price,
                                       Product.currencyCode,
                                       Product.stockQuantity,
                                       Product.mainCategoryName,
                                       Product.ratingCount,
                                       Product.averageRating)
        
        // expand primary image
        query = query.expand(Product.primaryImage)
        
        // load the whole product list with required properties
        let loadingIndicator = FUIModalLoadingIndicator.show(inView: tableView)
        Shop.shared.oDataService?.product(query: query) { products, error in
            loadingIndicator.dismiss()
            self.tableView.separatorStyle = .singleLine
            self.loadingProductsCompleted(loadedProducts: products, error: error)
        }
    }
    
    /// Assign the loaded products, update the counter, reload the table and check if any errors occured
    func loadingProductsCompleted(loadedProducts: [Product]?, error: Error?) {
        
        var products = [Product]()
        
        if let loadedProducts = loadedProducts {
            
            products = loadedProducts
            
        } else if let error = error {
            
            logger.error("Error loading Product.", error: error)
            
            let optionMenu = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            
            optionMenu.addAction(cancelAction)
            present(optionMenu, animated: true)
        }
        
        self.products = products
        tableView.reloadData()
    }
}
    


extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    // Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objectCell = tableView.dequeueReusableCell(withIdentifier: objectCellId,
                                                       for: indexPath as IndexPath) as! FUIObjectTableViewCell
        
        let product = products[indexPath.row]
        
        objectCell.headlineText = product.name
        objectCell.subheadlineText = product.id
        objectCell.footnoteText = product.mainCategoryName
        objectCell.descriptionText = product.description
        objectCell.detailImage = #imageLiteral(resourceName: "Placeholder")
        objectCell.detailImage?.accessibilityIdentifier = product.name
        objectCell.statusText = product.formattedPrice
        objectCell.substatusText = product.stockAvailability.itemText
        objectCell.substatusLabel.textColor = product.stockAvailability.color
        
        // load image asynchronously
        product.loadPrimaryImage { image, error in
            
            guard error == nil else {
                self.logger.warn("Error while loading image.", error: error)
                return
            }
            
            if let image = image,
                let delayedUpdatedCell = tableView.cellForRow(at: indexPath) as? FUIObjectTableViewCell {
                
                delayedUpdatedCell.detailImage = image
            }
        }
        return objectCell
    }

}
