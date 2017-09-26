//
//  FilterModel.swift
//  Shop
//
//  Created by Pragathi Kallu on 9/25/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import SAPOData

struct FilterModel {
    
    var searchText = ""
    
    /// Build product query that selects the products and properties we need
    var dataQuery: DataQuery {
        
        // Primary Properties
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
        
        // search (if set)
        if !searchText.isEmpty {
            
            let searchStringValue = StringValue.of(searchText.lowercased())
            
            let productNameQueryFunction = QueryFunction.contains(QueryFunction.toLower(Product.name), searchValue: searchStringValue)
            let productNameFilter = QueryFilter.from(productNameQueryFunction)
            
            let productIDQueryFunction = QueryFunction.contains(QueryFunction.toLower(Product.id), searchValue: searchStringValue)
            let productIDFilter = QueryFilter.from(productIDQueryFunction)
            
            let combinedSearchFilter = productNameFilter.or(productIDFilter)
            
            query = query.filter(combinedSearchFilter)
        }
        
        return query
    }
}
