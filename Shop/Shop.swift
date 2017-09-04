//
//  Shop.swift
//  Shop
//
//  Copyright © 2017 SAP SE or an SAP affiliate company. All rights reserved.
//  Use of this software subject to the End User License Agreement located in /src/EULA.pdf
//

import SAPFoundation
import SAPCommon
import SAPOData

/// The Shop singleton is the master instance of the shop. It creates and holds data that is global and
/// unique to the shop implementation, like a reference to the OData service proxy and an image cache
class Shop {

    // the Shop singleton
    static let shared = Shop()

    static let shoppingCartDidUpdateNotification = Notification.Name("shoppingCartDidUpdateNotification")

    let imageCache = NSCache<NSString, UIImage>()

    let oDataService: ShopService<OnlineODataProvider>?

    /// Initializes the dataService and dataProvider
    private init() {
        imageCache.name = "Loaded Images"
        oDataService = nil
    }
}
