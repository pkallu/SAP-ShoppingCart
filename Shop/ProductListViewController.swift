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
    var productSearchBar: FUISearchBar!
    var searchController: FUISearchController!
    let debouncer = Debouncer()
    var filterModel = FilterModel()

    @IBOutlet weak var filterButton: UIBarButtonItem!
    @IBOutlet weak var productConutBarButtonItem: UIBarButtonItem!
    private var productCountLabel = UILabel(frame: CGRect.zero)

    @IBOutlet weak var searchBarContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        configureSearchBar()
        setup()

    }
    
    /// Prepares the navigation to the DetailView or the FilterView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            switch identifier {
                
            case "showProductDetailSegue":
                
                let detailController = segue.destination as! DetailViewController
                let selectedRow = sender as! FUIObjectTableViewCell
                let selectedIndexPath = tableView.indexPath(for: selectedRow)!
                let selectedProduct = products[selectedIndexPath.row]
                detailController.productID = selectedProduct.id
                
            default:
                break
            }
        }
    }
    
    func setup() {
        filterButton.tintColor = .preferredFioriColor(forStyle: .tintColorDark)
    
        // add centered label with product count to the toolbar
        productCountLabel.sizeToFit()
        productCountLabel.backgroundColor = .clear
        productCountLabel.textAlignment = .center
        productCountLabel.font = .preferredFioriFont(forTextStyle: .caption2)
        productConutBarButtonItem.customView = productCountLabel
    }
    
    /// Updates the label in the status bar with the product count.
    func updateProductCounter() {
        
        let productText = products.count == 1 ? "Product" : "Products"
        
        productCountLabel.text = "\(products.count) \(productText)"
        productCountLabel.sizeToFit()
    }
    
    // Configure the search bar and enable the barcode scanner functionality.
    private func configureSearchBar() {
        
        // set the searchResultsController to nil because we use this
        // view controller for displaying the results
        searchController = FUISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchResultsUpdater = self
        productSearchBar = searchController.searchBar
        
        // Add barcode scanner
        productSearchBar.isBarcodeScannerEnabled = true
        productSearchBar.barcodeScanner?.scanMode = .all
        productSearchBar.barcodeScanner?.scanResultTransformer = { scanResult in
            return scanResult
        }
        
        productSearchBar.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.searchBarContainer.addSubview(searchController.searchBar)
        productSearchBar.sizeToFit()
        
        definesPresentationContext = true
    }
    
    func loadProducts() {
        
        // load the whole product list with required properties
        let loadingIndicator = FUIModalLoadingIndicator.show(inView: tableView)
        Shop.shared.oDataService?.product(query: filterModel.dataQuery) { products, error in
            loadingIndicator.dismiss()
            self.tableView.separatorStyle = .singleLine
            self.loadingProductsCompleted(loadedProducts: products, error: error)
        }
        
        NotificationCenter.default.post(name: Shop.shoppingCartDidUpdateNotification, object: nil)
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
        updateProductCounter()
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let addToCart = UITableViewRowAction(style: .normal, title: "Add to Cart") { _, _ in
            
            // remove swiped-in button
            tableView.setEditing(false, animated: true)
            
            let swipedProduct = self.products[indexPath.row]
            
            self.logger.debug("Adding product \(swipedProduct.name) (\(swipedProduct.id)) to shopping cart.")
            Shop.shared.oDataService?.addProductToShoppingCart(productID: swipedProduct.id) { shoppingCartItem, error in
                
                guard error == nil else {
                    self.logger.warn("Error adding product \(swipedProduct.name) (\(swipedProduct.id)) to shopping cart.", error: error)
                    return
                }
                FUIToastMessage.show(message: "\(swipedProduct.name) added to cart.", maxNumberOfLines:2)
                
                NotificationCenter.default.post(name: Shop.shoppingCartDidUpdateNotification, object: nil)
                
            }
        }
        // set color of swiped-in button
        addToCart.backgroundColor = .preferredFioriColor(forStyle: .tintColorDark)
        return [addToCart]
        
    }
}

//MARK: - UISearchResultsUpdating
extension ProductListViewController : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        debouncer.debounce {
            let text = searchController.searchBar.text ?? ""
            self.filterModel.searchText = text.trimmingCharacters(in: .whitespaces)
            Shop.shared.oDataService?.product(query: self.filterModel.dataQuery,
                                              completionHandler: self.loadingProductsCompleted)
        }
    }
}
