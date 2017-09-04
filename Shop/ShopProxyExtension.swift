//
//  ShopProxyExtension.swift
//  Shop
//
//  Copyright © 2017 SAP SE or an SAP affiliate company. All rights reserved.
//  Use of this software subject to the End User License Agreement located in ../EULA.pdf
//

import UIKit
import SAPOData
import SAPFiori

// MARK: - ShoppingCart
extension ShoppingCart {
    
    /// Formats the price string
    ///
    /// - Parameter price: price
    /// - Returns: Formatted price string
    func formattedString(forPrice price: BigDecimal) -> String {
        return CurrencyFormatter.string(forPrice: price, currencyCode: self.currencyCode)
    }
}

// MARK: - Product
extension Product {

    /// Returns formatted text and color depending on stock quantity
    ///
    /// - Returns: Formatted text and color depending on stock quantity
    var stockAvailability: (itemText: String, groupHeaderText: String, color: UIColor) {
        
        let criticalAvailability = 9
        
        let itemText: String
        let groupHeaderText: String
        let color: UIColor
        
        switch stockQuantity {
        case 1 ... criticalAvailability:
            itemText = "Only \(stockQuantity) left"
            groupHeaderText = "Only a few left"
            color = .preferredFioriColor(forStyle: .critical)
        case 0:
            itemText = "Out of stock"
            groupHeaderText = "Out of stock"
            color = .preferredFioriColor(forStyle: .negative)
        default:
            itemText = ""
            groupHeaderText = "In stock"
            color = .preferredFioriColor(forStyle: .positive)
        }
        
        return (itemText, groupHeaderText, color)
    }
    
    /// Returns formatted price text
    ///
    /// - Returns: Formatted price text
    var formattedPrice: String {
        return CurrencyFormatter.string(forPrice: self.price, currencyCode: self.currencyCode)
    }
    
    /// Loads images from the backend and caches them
    ///
    /// - Parameter streamLink: The download stream link of the entity
    /// - Parameter imageNumber: The number of the image within the product (1..n). Defaults to 1.
    /// - Parameter completionHandler: Will be called with the loaded image or an error
    private func loadImage(from streamLink: StreamLink, imageNumber: Int = 1, completionHandler: @escaping (UIImage?, Error?) -> Void) {
        
        // compute a dictionary key for the image cache
        let imageKey = id.appending(String(imageNumber)) as NSString
        
        // checkif image exists already in cache
        if let image = Shop.shared.imageCache.object(forKey: imageKey) {
            // decouple
            OperationQueue.main.addOperation {
                completionHandler(image, nil)
            }
            return
        }
        
        // load image in background
        Shop.shared.oDataService?.downloadStream(entity: self, link: streamLink) { data, error in
            guard error == nil,
                let data = data,
                let image = UIImage(data: data) else {
                    completionHandler(nil, error)
                    return
            }
            
            Shop.shared.imageCache.setObject(image, forKey: imageKey)
            completionHandler(image, nil)
        }
    }
    
    /// Loads primary product image from the backend or cache
    ///
    /// - Parameter completionHandler: Will be called with the loaded image or an error
    func loadPrimaryImage(completionHandler: @escaping (UIImage?, Error?) -> Void) {
        
        guard let primaryImage = primaryImage else {
            completionHandler(nil, nil)
            return
        }
        
        let dataStreamLink = primaryImage.streamLink(for: Image.data)
        loadImage(from: dataStreamLink, completionHandler: completionHandler)
    }
    
    /// Loads image entity from the backend or cache
    ///
    /// - Parameter imageEntity: An image type entity
    /// - Parameter completionHandler: Will be called with the loaded image or an error
    func loadImage(for imageEntity: Image, completionHandler: @escaping (UIImage?, Error?) -> Void) {
        
        let dataStreamLink = imageEntity.streamLink(for: Image.data)
        loadImage(from: dataStreamLink, imageNumber: imageEntity.imageID, completionHandler: completionHandler)
    }
}
