//
//  DetailViewController.swift
//  Shop
//
//  Created by Pragathi Kallu on 9/9/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit
import SAPCommon
import SAPFiori
import SAPOData

class DetailViewController: UIViewController {
    
    let logger = Logger.shared(named: "DetailViewController");
    var productID: String?
    @IBOutlet var productView: ProductDetailView!
    
    fileprivate var product: Product? {
        didSet {
            productView.product = product
            self.navigationController?.title = product?.name;
            productView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadProductDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadProductDetails() {
        if let productid = productID {
            // create a query for products matching the given id
            // (which will return only one product)
            var query = DataQuery().withKey(Product.key(id: productid))
            
            // include all associated images in the result
            query = query.expand(Product.images)
            
            // include associated reviews in the result and sort them by the helpful count in descending order,
            // then limit to 3 entries (= top 3 helpful reviews)
            query = query.expand(Product.reviews, withQuery: DataQuery().orderBy(Review.helpfulCount, .descending).top(3))
            
            let loadingIndicator = FUIModalLoadingIndicator.show(inView: view)
            Shop.shared.oDataService?.product(query: query) { products, error in
                
                loadingIndicator.dismiss()
                
                guard error == nil else {
                    self.logger.warn("Error while loading product details", error: error)
                    self.product = nil
                    return
                }
                
                self.product = products?.first
            }
        }
        NotificationCenter.default.post(name: Shop.shoppingCartDidUpdateNotification, object: nil)
    }
    
}

extension DetailViewController: ProductDetailViewDelegate {
    
    func didSelectAddToCart(_ button: FUIButton) {
        
    }
    
    func didSelectReview(_ review: Review) {
        
    }
    
    func didSelectShowAllReviews(_ button: FUIButton) {
        
    }
    
    func didSelectWriteReview(_ button: FUIButton) {
        
    }   
}
