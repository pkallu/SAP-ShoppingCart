//
//  FilterModel.swift
//  Shop
//
//  Created by Pragathi Kallu on 9/25/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import SAPOData
/// The different QueryTypes which are possible in the FilterView in the order they are
///displayed
enum QueryType: Int {
    case sortBy = 0
    case reset
    
    static let count = 2
}

struct FilterModel {
    let sortItems = [
        SortItem(label: "Product Name (A-Z)", property: Product.name,
                 order: .ascending),
        SortItem(label: "Product Name (Z-A)", property: Product.name,
                 order: .descending),
        SortItem(label: "Price (High-Low)", property: Product.price,
                 order: .descending),
        SortItem(label: "Price (Low-High)", property: Product.price, order: .ascending),
        SortItem(label: "Average Rating", property: Product.averageRating,
                 order: .descending),
        SortItem(label: "Availability", property: Product.stockQuantity,
                 order: .ascending)
    ]
    
    let sortItemGroup: QueryItemGroup<SortItem>
    
    // the selected sorter indices are handled seperately
    // because they needed to be treated differently when building the OData query
    var selectedSortItemIndices: [Int]
    
    /// return the total number of applied filter/sorting criteria (deviating from default)
    public var numberOfNonDefaultFilters: Int {
        
        // count non-default sort settings only
        let count = selectedSortItems?.reduce(0) { counter, item in
            // Product.name ascending is the default filter, so we don't count this
            
            //filter
            item.property.name == Product.name.name && item.order == .ascending ?
                counter : counter + 1
            } ?? 0
        
        return count
    }
    
    private var selectedSortItems: [SortItem]? {
        
        guard !selectedSortItemIndices.isEmpty else {
            return nil
        }
        
        var sorters = [SortItem]()
        for index in selectedSortItemIndices {
            
            if let sortItem = sortItemGroup[index] {
                sorters.append(sortItem)
            }
        }
        return sorters
    }
    
    init() {
        
        sortItemGroup = QueryItemGroup(title: "Sort By", items: sortItems)
        
        // set the default selected sorter for the FilterView
        selectedSortItemIndices = [0]
    }
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
        
        // sorting (if set, default else)
        if let sortItems = selectedSortItems {
            for sortItem in sortItems {
                query = query.orderBy(sortItem.property, sortItem.order)
            }
        } else {
            // Standard sorting: by product name
            query = query.orderBy(Product.name)
        }
        
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
