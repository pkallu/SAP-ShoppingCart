//
//  QueryItems.swift
//  Shop
//
//  Created by Pragathi Kallu on 9/26/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import SAPOData

/// Query Items need to have a label
protocol Labeled {
    var label: String { get }
}

/// SortItem is used for sorting in OData
/// for a certain property in a certain order
/// it also needs a label for being displayed in the FilterView
struct SortItem: Labeled {
    var label = ""
    var property: Property
    var order: SortOrder = .ascending
}


/// QueryItems are used to group together the different Sort-/Filter-/Group-Items
/// and give them a title which is displayed in the FilterView
struct QueryItemGroup<QueryItem: Labeled> {
    
    subscript(index: Int) -> QueryItem? {
        get {
            return item(at: index)
        }
    }
    
    private let items: [QueryItem]
    
    let title: String
    let allowsMultipleSelection: Bool
    let allowsEmptySelection: Bool
    
    init(title: String, items: [QueryItem], allowsMultipleSelection: Bool = false,
         allowsEmptySelection: Bool = false) {
        self.title = title
        self.items = items
        self.allowsMultipleSelection = allowsMultipleSelection
        self.allowsEmptySelection = allowsEmptySelection
    }
    
    /// Get the labels of the contained QueryItems
    ///
    /// - Returns: an array with the labels of the QueryItems
    var labels: [String] {
        return items.map { $0.label }
    }
    
    /// Get an item at a certain index
    ///
    /// - Parameter index: the desired index
    /// - Returns: the QueryItem at the certain index
    func item(at index: Int) -> QueryItem? {
        return items.indices.contains(index) ? items[index] : nil
    }
}
