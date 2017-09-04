//# xsc 17.5.3-9e1425-20170523

import SAPOData
import Foundation

open class Image: EntityValue {
    public static let imageSet: Property = ShopServiceMetadata.EntityTypes.image.property(withName: "ImageSet")

    public static let imageID: Property = ShopServiceMetadata.EntityTypes.image.property(withName: "ImageId")

    public static let data: Property = ShopServiceMetadata.EntityTypes.image.property(withName: "Data")

    public init() {
        super.init(type: ShopServiceMetadata.EntityTypes.image)
    }

    open class func array(from: EntityValueList) -> Array<Image> {
        return ArrayConverter.convert(from.toArray(), Array<Image>())
    }

    open func copy() -> Image {
        return CastRequired<Image>.from(self.copyEntity())
    }

    open var data: StreamLink {
        get {
            return self.streamLink(for: Image.data)
        }
    }

    open var imageID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Image.imageID))
        }
        set(value) {
            self.setDataValue(for: Image.imageID, to: IntValue.of(value))
        }
    }

    open var imageSet: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Image.imageSet))
        }
        set(value) {
            self.setDataValue(for: Image.imageSet, to: StringValue.of(value))
        }
    }

    open class func key(imageSet: String, imageID: Int) -> EntityKey {
        return EntityKey().with(name: "ImageSet", value: StringValue.of(imageSet)).with(name: "ImageId", value: IntValue.of(imageID))
    }

    open var old: Image {
        get {
            return CastRequired<Image>.from(self.oldEntity)
        }
    }
}

open class MainCategory: EntityValue {
    public static let id: Property = ShopServiceMetadata.EntityTypes.mainCategory.property(withName: "Id")

    public static let name: Property = ShopServiceMetadata.EntityTypes.mainCategory.property(withName: "Name")

    public static let subCategories: Property = ShopServiceMetadata.EntityTypes.mainCategory.property(withName: "SubCategories")

    public init() {
        super.init(type: ShopServiceMetadata.EntityTypes.mainCategory)
    }

    open class func array(from: EntityValueList) -> Array<MainCategory> {
        return ArrayConverter.convert(from.toArray(), Array<MainCategory>())
    }

    open func copy() -> MainCategory {
        return CastRequired<MainCategory>.from(self.copyEntity())
    }

    open var id: String {
        get {
            return StringValue.unwrap(self.dataValue(for: MainCategory.id))
        }
        set(value) {
            self.setDataValue(for: MainCategory.id, to: StringValue.of(value))
        }
    }

    open class func key(id: String) -> EntityKey {
        return EntityKey().with(name: "Id", value: StringValue.of(id))
    }

    open var name: String {
        get {
            return StringValue.unwrap(self.dataValue(for: MainCategory.name))
        }
        set(value) {
            self.setDataValue(for: MainCategory.name, to: StringValue.of(value))
        }
    }

    open var old: MainCategory {
        get {
            return CastRequired<MainCategory>.from(self.oldEntity)
        }
    }

    open var subCategories: Array<SubCategory> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: MainCategory.subCategories)).toArray(), Array<SubCategory>())
        }
        set(value) {
            MainCategory.subCategories.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }
}

open class Product: EntityValue {
    public static let id: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "Id")

    public static let name: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "Name")

    public static let description: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "Description")

    public static let dimensionUnit: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "DimensionUnit")

    public static let dimensionHeight: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "DimensionHeight")

    public static let dimensionWidth: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "DimensionWidth")

    public static let dimensionDepth: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "DimensionDepth")

    public static let weightUnit: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "WeightUnit")

    public static let weightMeasure: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "WeightMeasure")

    public static let price: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "Price")

    public static let currencyCode: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "CurrencyCode")

    public static let quantityUnit: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "QuantityUnit")

    public static let measureUnit: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "MeasureUnit")

    public static let stockQuantity: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "StockQuantity")

    public static let averageRating: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "AverageRating")

    public static let ratingCount: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "RatingCount")

    public static let supplierID: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "SupplierId")

    public static let supplierName: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "SupplierName")

    public static let subCategoryID: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "SubCategoryId")

    public static let subCategoryName: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "SubCategoryName")

    public static let mainCategoryID: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "MainCategoryId")

    public static let mainCategoryName: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "MainCategoryName")

    public static let lastModified: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "LastModified")

    public static let reviewCount1: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "ReviewCount1")

    public static let reviewCount2: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "ReviewCount2")

    public static let reviewCount3: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "ReviewCount3")

    public static let reviewCount4: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "ReviewCount4")

    public static let reviewCount5: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "ReviewCount5")

    public static let isFavoriteOfCurrentUser: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "IsFavoriteOfCurrentUser")

    public static let hasReviewOfCurrentUser: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "HasReviewOfCurrentUser")

    public static let subCategory: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "SubCategory")

    public static let supplier: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "Supplier")

    public static let reviews: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "Reviews")

    public static let images: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "Images")

    public static let primaryImage: Property = ShopServiceMetadata.EntityTypes.product.property(withName: "PrimaryImage")

    public init() {
        super.init(type: ShopServiceMetadata.EntityTypes.product)
    }

    open class func array(from: EntityValueList) -> Array<Product> {
        return ArrayConverter.convert(from.toArray(), Array<Product>())
    }

    open var averageRating: BigDecimal {
        get {
            return DecimalValue.unwrap(self.dataValue(for: Product.averageRating))
        }
        set(value) {
            self.setDataValue(for: Product.averageRating, to: DecimalValue.of(value))
        }
    }

    open func copy() -> Product {
        return CastRequired<Product>.from(self.copyEntity())
    }

    open var currencyCode: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.currencyCode))
        }
        set(value) {
            self.setDataValue(for: Product.currencyCode, to: StringValue.of(value))
        }
    }

    open var description: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.description))
        }
        set(value) {
            self.setDataValue(for: Product.description, to: StringValue.of(value))
        }
    }

    open var dimensionDepth: BigDecimal {
        get {
            return DecimalValue.unwrap(self.dataValue(for: Product.dimensionDepth))
        }
        set(value) {
            self.setDataValue(for: Product.dimensionDepth, to: DecimalValue.of(value))
        }
    }

    open var dimensionHeight: BigDecimal {
        get {
            return DecimalValue.unwrap(self.dataValue(for: Product.dimensionHeight))
        }
        set(value) {
            self.setDataValue(for: Product.dimensionHeight, to: DecimalValue.of(value))
        }
    }

    open var dimensionUnit: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.dimensionUnit))
        }
        set(value) {
            self.setDataValue(for: Product.dimensionUnit, to: StringValue.of(value))
        }
    }

    open var dimensionWidth: BigDecimal {
        get {
            return DecimalValue.unwrap(self.dataValue(for: Product.dimensionWidth))
        }
        set(value) {
            self.setDataValue(for: Product.dimensionWidth, to: DecimalValue.of(value))
        }
    }

    open var hasReviewOfCurrentUser: Bool {
        get {
            return BooleanValue.unwrap(self.dataValue(for: Product.hasReviewOfCurrentUser))
        }
        set(value) {
            self.setDataValue(for: Product.hasReviewOfCurrentUser, to: BooleanValue.of(value))
        }
    }

    open var id: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.id))
        }
        set(value) {
            self.setDataValue(for: Product.id, to: StringValue.of(value))
        }
    }

    open var images: Array<Image> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Product.images)).toArray(), Array<Image>())
        }
        set(value) {
            Product.images.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var isFavoriteOfCurrentUser: Bool {
        get {
            return BooleanValue.unwrap(self.dataValue(for: Product.isFavoriteOfCurrentUser))
        }
        set(value) {
            self.setDataValue(for: Product.isFavoriteOfCurrentUser, to: BooleanValue.of(value))
        }
    }

    open class func key(id: String) -> EntityKey {
        return EntityKey().with(name: "Id", value: StringValue.of(id))
    }

    open var lastModified: GlobalDateTime {
        get {
            return GlobalDateTime.castRequired(self.dataValue(for: Product.lastModified))
        }
        set(value) {
            self.setDataValue(for: Product.lastModified, to: value)
        }
    }

    open var mainCategoryID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.mainCategoryID))
        }
        set(value) {
            self.setDataValue(for: Product.mainCategoryID, to: StringValue.of(value))
        }
    }

    open var mainCategoryName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.mainCategoryName))
        }
        set(value) {
            self.setDataValue(for: Product.mainCategoryName, to: StringValue.of(value))
        }
    }

    open var measureUnit: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.measureUnit))
        }
        set(value) {
            self.setDataValue(for: Product.measureUnit, to: StringValue.of(value))
        }
    }

    open var name: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.name))
        }
        set(value) {
            self.setDataValue(for: Product.name, to: StringValue.of(value))
        }
    }

    open var old: Product {
        get {
            return CastRequired<Product>.from(self.oldEntity)
        }
    }

    open var price: BigDecimal {
        get {
            return DecimalValue.unwrap(self.dataValue(for: Product.price))
        }
        set(value) {
            self.setDataValue(for: Product.price, to: DecimalValue.of(value))
        }
    }

    open var primaryImage: Image? {
        get {
            return CastOptional<Image>.from(self.dataValue(for: Product.primaryImage))
        }
        set(value) {
            self.setDataValue(for: Product.primaryImage, to: value)
        }
    }

    open var quantityUnit: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.quantityUnit))
        }
        set(value) {
            self.setDataValue(for: Product.quantityUnit, to: StringValue.of(value))
        }
    }

    open var ratingCount: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Product.ratingCount))
        }
        set(value) {
            self.setDataValue(for: Product.ratingCount, to: IntValue.of(value))
        }
    }

    open var reviewCount1: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Product.reviewCount1))
        }
        set(value) {
            self.setDataValue(for: Product.reviewCount1, to: IntValue.of(value))
        }
    }

    open var reviewCount2: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Product.reviewCount2))
        }
        set(value) {
            self.setDataValue(for: Product.reviewCount2, to: IntValue.of(value))
        }
    }

    open var reviewCount3: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Product.reviewCount3))
        }
        set(value) {
            self.setDataValue(for: Product.reviewCount3, to: IntValue.of(value))
        }
    }

    open var reviewCount4: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Product.reviewCount4))
        }
        set(value) {
            self.setDataValue(for: Product.reviewCount4, to: IntValue.of(value))
        }
    }

    open var reviewCount5: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Product.reviewCount5))
        }
        set(value) {
            self.setDataValue(for: Product.reviewCount5, to: IntValue.of(value))
        }
    }

    open var reviews: Array<Review> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Product.reviews)).toArray(), Array<Review>())
        }
        set(value) {
            Product.reviews.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var stockQuantity: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Product.stockQuantity))
        }
        set(value) {
            self.setDataValue(for: Product.stockQuantity, to: IntValue.of(value))
        }
    }

    open var subCategory: Array<SubCategory> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Product.subCategory)).toArray(), Array<SubCategory>())
        }
        set(value) {
            Product.subCategory.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var subCategoryID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.subCategoryID))
        }
        set(value) {
            self.setDataValue(for: Product.subCategoryID, to: StringValue.of(value))
        }
    }

    open var subCategoryName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.subCategoryName))
        }
        set(value) {
            self.setDataValue(for: Product.subCategoryName, to: StringValue.of(value))
        }
    }

    open var supplier: Array<Supplier> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Product.supplier)).toArray(), Array<Supplier>())
        }
        set(value) {
            Product.supplier.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var supplierID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.supplierID))
        }
        set(value) {
            self.setDataValue(for: Product.supplierID, to: StringValue.of(value))
        }
    }

    open var supplierName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.supplierName))
        }
        set(value) {
            self.setDataValue(for: Product.supplierName, to: StringValue.of(value))
        }
    }

    open var weightMeasure: BigDecimal {
        get {
            return DecimalValue.unwrap(self.dataValue(for: Product.weightMeasure))
        }
        set(value) {
            self.setDataValue(for: Product.weightMeasure, to: DecimalValue.of(value))
        }
    }

    open var weightUnit: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.weightUnit))
        }
        set(value) {
            self.setDataValue(for: Product.weightUnit, to: StringValue.of(value))
        }
    }
}

open class Review: EntityValue {
    public static let id: Property = ShopServiceMetadata.EntityTypes.review.property(withName: "Id")

    public static let comment: Property = ShopServiceMetadata.EntityTypes.review.property(withName: "Comment")

    public static let helpfulCount: Property = ShopServiceMetadata.EntityTypes.review.property(withName: "HelpfulCount")

    public static let helpfulForCurrentUser: Property = ShopServiceMetadata.EntityTypes.review.property(withName: "HelpfulForCurrentUser")

    public static let productID: Property = ShopServiceMetadata.EntityTypes.review.property(withName: "ProductId")

    public static let rating: Property = ShopServiceMetadata.EntityTypes.review.property(withName: "Rating")

    public static let changedAt: Property = ShopServiceMetadata.EntityTypes.review.property(withName: "ChangedAt")

    public static let isReviewOfCurrentUser: Property = ShopServiceMetadata.EntityTypes.review.property(withName: "IsReviewOfCurrentUser")

    public static let userDisplayName: Property = ShopServiceMetadata.EntityTypes.review.property(withName: "UserDisplayName")

    public init() {
        super.init(type: ShopServiceMetadata.EntityTypes.review)
    }

    open class func array(from: EntityValueList) -> Array<Review> {
        return ArrayConverter.convert(from.toArray(), Array<Review>())
    }

    open var changedAt: GlobalDateTime {
        get {
            return GlobalDateTime.castRequired(self.dataValue(for: Review.changedAt))
        }
        set(value) {
            self.setDataValue(for: Review.changedAt, to: value)
        }
    }

    open var comment: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Review.comment))
        }
        set(value) {
            self.setDataValue(for: Review.comment, to: StringValue.of(value))
        }
    }

    open func copy() -> Review {
        return CastRequired<Review>.from(self.copyEntity())
    }

    open var helpfulCount: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Review.helpfulCount))
        }
        set(value) {
            self.setDataValue(for: Review.helpfulCount, to: IntValue.of(value))
        }
    }

    open var helpfulForCurrentUser: Bool {
        get {
            return BooleanValue.unwrap(self.dataValue(for: Review.helpfulForCurrentUser))
        }
        set(value) {
            self.setDataValue(for: Review.helpfulForCurrentUser, to: BooleanValue.of(value))
        }
    }

    open var id: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Review.id))
        }
        set(value) {
            self.setDataValue(for: Review.id, to: StringValue.of(value))
        }
    }

    open var isReviewOfCurrentUser: Bool {
        get {
            return BooleanValue.unwrap(self.dataValue(for: Review.isReviewOfCurrentUser))
        }
        set(value) {
            self.setDataValue(for: Review.isReviewOfCurrentUser, to: BooleanValue.of(value))
        }
    }

    open class func key(id: String) -> EntityKey {
        return EntityKey().with(name: "Id", value: StringValue.of(id))
    }

    open var old: Review {
        get {
            return CastRequired<Review>.from(self.oldEntity)
        }
    }

    open var productID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Review.productID))
        }
        set(value) {
            self.setDataValue(for: Review.productID, to: StringValue.of(value))
        }
    }

    open var rating: BigInteger {
        get {
            return IntegerValue.unwrap(self.dataValue(for: Review.rating))
        }
        set(value) {
            self.setDataValue(for: Review.rating, to: IntegerValue.of(value))
        }
    }

    open var userDisplayName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Review.userDisplayName))
        }
        set(value) {
            self.setDataValue(for: Review.userDisplayName, to: StringValue.of(value))
        }
    }
}

open class ShopService<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = ShopServiceMetadata.document
    }

    open func addProductToShoppingCart(productID: String, query: DataQuery = DataQuery()) throws -> ShoppingCartItem {
        return try CastRequired<ShoppingCartItem>.from(self.executeQuery(query.invoke(ShopServiceMetadata.ActionImports.addProductToShoppingCart, ParameterList(capacity: 1).with(name: "ProductId", value: StringValue.of(productID)))).result)
    }

    open func addProductToShoppingCart(productID: String, query: DataQuery = DataQuery(), completionHandler: @escaping (ShoppingCartItem?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: ShoppingCartItem = try self.addProductToShoppingCart(productID: productID, query: query)
            OperationQueue.main.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func buyShoppingCart(query: DataQuery = DataQuery()) throws -> ShoppingCart {
        return try CastRequired<ShoppingCart>.from(self.executeQuery(query.invoke(ShopServiceMetadata.ActionImports.buyShoppingCart, ParameterList.empty)).result)
    }

    open func buyShoppingCart(query: DataQuery = DataQuery(), completionHandler: @escaping (ShoppingCart?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: ShoppingCart = try self.buyShoppingCart(query: query)
            OperationQueue.main.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func image(query: DataQuery = DataQuery()) throws -> Array<Image> {
        return try Image.array(from: self.executeQuery(query.from(ShopServiceMetadata.EntitySets.image)).entityList())
    }

    open func image(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Image>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<Image> = try self.image(query: query)
            OperationQueue.main.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func mainCategory(query: DataQuery = DataQuery()) throws -> Array<MainCategory> {
        return try MainCategory.array(from: self.executeQuery(query.from(ShopServiceMetadata.EntitySets.mainCategory)).entityList())
    }

    open func mainCategory(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MainCategory>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<MainCategory> = try self.mainCategory(query: query)
            OperationQueue.main.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func product(query: DataQuery = DataQuery()) throws -> Array<Product> {
        return try Product.array(from: self.executeQuery(query.from(ShopServiceMetadata.EntitySets.product)).entityList())
    }

    open func product(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Product>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<Product> = try self.product(query: query)
            OperationQueue.main.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func resetShop(currencyCode: String, query: DataQuery = DataQuery()) throws -> Void {
        try Ignore.valueOf_any(self.executeQuery(query.invoke(ShopServiceMetadata.ActionImports.resetShop, ParameterList(capacity: 1).with(name: "CurrencyCode", value: StringValue.of(currencyCode)))).result)
    }

    open func resetShop(currencyCode: String, query: DataQuery = DataQuery(), completionHandler: @escaping (Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            try self.resetShop(currencyCode: currencyCode, query: query)
            OperationQueue.main.addOperation {
                completionHandler(nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(error)
            }
        }
        }
    }

    open func review(query: DataQuery = DataQuery()) throws -> Array<Review> {
        return try Review.array(from: self.executeQuery(query.from(ShopServiceMetadata.EntitySets.review)).entityList())
    }

    open func review(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Review>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<Review> = try self.review(query: query)
            OperationQueue.main.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func shoppingCart(query: DataQuery = DataQuery()) throws -> Array<ShoppingCart> {
        return try ShoppingCart.array(from: self.executeQuery(query.from(ShopServiceMetadata.EntitySets.shoppingCart)).entityList())
    }

    open func shoppingCart(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<ShoppingCart>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<ShoppingCart> = try self.shoppingCart(query: query)
            OperationQueue.main.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func shoppingCartItem(query: DataQuery = DataQuery()) throws -> Array<ShoppingCartItem> {
        return try ShoppingCartItem.array(from: self.executeQuery(query.from(ShopServiceMetadata.EntitySets.shoppingCartItem)).entityList())
    }

    open func shoppingCartItem(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<ShoppingCartItem>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<ShoppingCartItem> = try self.shoppingCartItem(query: query)
            OperationQueue.main.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func subCategory(query: DataQuery = DataQuery()) throws -> Array<SubCategory> {
        return try SubCategory.array(from: self.executeQuery(query.from(ShopServiceMetadata.EntitySets.subCategory)).entityList())
    }

    open func subCategory(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SubCategory>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<SubCategory> = try self.subCategory(query: query)
            OperationQueue.main.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func supplier(query: DataQuery = DataQuery()) throws -> Array<Supplier> {
        return try Supplier.array(from: self.executeQuery(query.from(ShopServiceMetadata.EntitySets.supplier)).entityList())
    }

    open func supplier(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Supplier>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<Supplier> = try self.supplier(query: query)
            OperationQueue.main.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }
}

public class ShopServiceMetadata {
    public static let source: String = "<?xml version='1.0' encoding='UTF-8'?>\n<edmx:Edmx Version=\"4.0\" xmlns:edmx=\"http://docs.oasis-open.org/odata/ns/edmx\">\n<edmx:DataServices>\n<Schema xmlns=\"http://docs.oasis-open.org/odata/ns/edm\" Namespace=\"dataexposure.epmshop\">\n<EntityType Name=\"ShoppingCart\">\n<Key>\n<PropertyRef Name=\"Id\"/>\n</Key>\n<Property Name=\"Id\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"Total\" Type=\"Edm.Decimal\" Nullable=\"false\" Precision=\"15\" Scale=\"2\"/>\n<Property Name=\"CurrencyCode\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"5\"/>\n<Property Name=\"TotalQuantity\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"FormattedCustomerName\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"81\"/>\n<Property Name=\"FormattedAddress\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"129\"/>\n<Property Name=\"LogonName\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"255\"/>\n<NavigationProperty Name=\"ShoppingCartItems\" Type=\"Collection(dataexposure.epmshop.ShoppingCartItem)\"/>\n</EntityType>\n<EntityType Name=\"SubCategory\">\n<Key>\n<PropertyRef Name=\"Id\"/>\n</Key>\n<Property Name=\"Id\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"40\"/>\n<Property Name=\"Name\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"40\"/>\n<Property Name=\"MainCategoryId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"40\"/>\n<Property Name=\"MainCategoryName\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"40\"/>\n<NavigationProperty Name=\"MainCategory\" Type=\"dataexposure.epmshop.MainCategory\" Nullable=\"false\"/>\n</EntityType>\n<EntityType Name=\"Product\">\n<Key>\n<PropertyRef Name=\"Id\"/>\n</Key>\n<Property Name=\"Id\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"13\"/>\n<Property Name=\"Name\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"255\"/>\n<Property Name=\"Description\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"255\"/>\n<Property Name=\"DimensionUnit\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"3\"/>\n<Property Name=\"DimensionHeight\" Type=\"Edm.Decimal\" Nullable=\"false\" Precision=\"13\" Scale=\"3\"/>\n<Property Name=\"DimensionWidth\" Type=\"Edm.Decimal\" Nullable=\"false\" Precision=\"13\" Scale=\"3\"/>\n<Property Name=\"DimensionDepth\" Type=\"Edm.Decimal\" Nullable=\"false\" Precision=\"13\" Scale=\"3\"/>\n<Property Name=\"WeightUnit\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"3\"/>\n<Property Name=\"WeightMeasure\" Type=\"Edm.Decimal\" Nullable=\"false\" Precision=\"13\" Scale=\"3\"/>\n<Property Name=\"Price\" Type=\"Edm.Decimal\" Nullable=\"false\" Precision=\"15\" Scale=\"2\"/>\n<Property Name=\"CurrencyCode\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"5\"/>\n<Property Name=\"QuantityUnit\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"3\"/>\n<Property Name=\"MeasureUnit\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"3\"/>\n<Property Name=\"StockQuantity\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"AverageRating\" Type=\"Edm.Decimal\" Nullable=\"false\" Precision=\"11\" Scale=\"1\"/>\n<Property Name=\"RatingCount\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"SupplierId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"13\"/>\n<Property Name=\"SupplierName\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"80\"/>\n<Property Name=\"SubCategoryId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"40\"/>\n<Property Name=\"SubCategoryName\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"40\"/>\n<Property Name=\"MainCategoryId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"40\"/>\n<Property Name=\"MainCategoryName\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"40\"/>\n<Property Name=\"LastModified\" Type=\"Edm.DateTimeOffset\" Nullable=\"false\"/>\n<Property Name=\"ReviewCount1\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"ReviewCount2\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"ReviewCount3\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"ReviewCount4\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"ReviewCount5\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"IsFavoriteOfCurrentUser\" Type=\"Edm.Boolean\" Nullable=\"false\"/>\n<Property Name=\"HasReviewOfCurrentUser\" Type=\"Edm.Boolean\" Nullable=\"false\"/>\n<NavigationProperty Name=\"SubCategory\" Type=\"Collection(dataexposure.epmshop.SubCategory)\"/>\n<NavigationProperty Name=\"Supplier\" Type=\"Collection(dataexposure.epmshop.Supplier)\"/>\n<NavigationProperty Name=\"Reviews\" Type=\"Collection(dataexposure.epmshop.Review)\"/>\n<NavigationProperty Name=\"Images\" Type=\"Collection(dataexposure.epmshop.Image)\"/>\n<NavigationProperty Name=\"PrimaryImage\" Type=\"dataexposure.epmshop.Image\"/>\n</EntityType>\n<EntityType Name=\"ShoppingCartItem\">\n<Key>\n<PropertyRef Name=\"ShoppingCartId\"/>\n<PropertyRef Name=\"Id\"/>\n</Key>\n<Property Name=\"ShoppingCartId\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"Id\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"10\"/>\n<Property Name=\"ProductId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"10\"/>\n<Property Name=\"Quantity\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"Unit\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"3\"/>\n<Property Name=\"SubTotal\" Type=\"Edm.Decimal\" Nullable=\"false\" Precision=\"26\" Scale=\"2\"/>\n<Property Name=\"CurrencyCode\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"5\"/>\n<NavigationProperty Name=\"Product\" Type=\"dataexposure.epmshop.Product\"/>\n</EntityType>\n<EntityType Name=\"Supplier\">\n<Key>\n<PropertyRef Name=\"Id\"/>\n</Key>\n<Property Name=\"Id\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"13\"/>\n<Property Name=\"Name\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"80\"/>\n<Property Name=\"Phone\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"30\"/>\n<Property Name=\"Email\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"255\"/>\n<Property Name=\"WebAddress\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"5000\"/>\n<Property Name=\"FormattedAddress\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"129\"/>\n<Property Name=\"FormattedContactName\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"81\"/>\n<Property Name=\"ContactPhone1\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"30\"/>\n<Property Name=\"ContactPhone2\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"30\"/>\n<Property Name=\"ContactEmail\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"255\"/>\n</EntityType>\n<EntityType Name=\"Review\">\n<Key>\n<PropertyRef Name=\"Id\"/>\n</Key>\n<Property Name=\"Id\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"5000\"/>\n<Property Name=\"Comment\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"5000\"/>\n<Property Name=\"HelpfulCount\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"HelpfulForCurrentUser\" Type=\"Edm.Boolean\" Nullable=\"false\"/>\n<Property Name=\"ProductId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"13\"/>\n<Property Name=\"Rating\" Type=\"Edm.Decimal\" Nullable=\"false\" Precision=\"4\" Scale=\"0\"/>\n<Property Name=\"ChangedAt\" Type=\"Edm.DateTimeOffset\" Nullable=\"false\"/>\n<Property Name=\"IsReviewOfCurrentUser\" Type=\"Edm.Boolean\" Nullable=\"false\"/>\n<Property Name=\"UserDisplayName\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"81\"/>\n</EntityType>\n<EntityType Name=\"Image\">\n<Key>\n<PropertyRef Name=\"ImageSet\"/>\n<PropertyRef Name=\"ImageId\"/>\n</Key>\n<Property Name=\"ImageSet\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"13\"/>\n<Property Name=\"ImageId\" Type=\"Edm.Int32\" Nullable=\"false\"/>\n<Property Name=\"Data\" Type=\"Edm.Stream\"/>\n</EntityType>\n<EntityType Name=\"MainCategory\">\n<Key>\n<PropertyRef Name=\"Id\"/>\n</Key>\n<Property Name=\"Id\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"40\"/>\n<Property Name=\"Name\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"40\"/>\n<NavigationProperty Name=\"SubCategories\" Type=\"Collection(dataexposure.epmshop.SubCategory)\"/>\n</EntityType>\n<Action Name=\"AddProductToShoppingCart\" IsBound=\"false\">\n<Parameter Name=\"ProductId\" Type=\"Edm.String\" Nullable=\"false\"/>\n<ReturnType Type=\"dataexposure.epmshop.ShoppingCartItem\" Nullable=\"false\"/>\n</Action>\n<Action Name=\"BuyShoppingCart\" IsBound=\"false\">\n<ReturnType Type=\"dataexposure.epmshop.ShoppingCart\" Nullable=\"false\"/>\n</Action>\n<Action Name=\"ResetShop\" IsBound=\"false\">\n<Parameter Name=\"CurrencyCode\" Type=\"Edm.String\" Nullable=\"false\"/>\n</Action>\n<EntityContainer Name=\"EntityContainer_52E5CAF81DF84C9CAEA930D6D6D51B17\">\n<EntitySet Name=\"ShoppingCart\" EntityType=\"dataexposure.epmshop.ShoppingCart\">\n<NavigationPropertyBinding Path=\"ShoppingCartItems\" Target=\"dataexposure.epmshop.EntityContainer_52E5CAF81DF84C9CAEA930D6D6D51B17/ShoppingCartItem\"/>\n</EntitySet>\n<EntitySet Name=\"SubCategory\" EntityType=\"dataexposure.epmshop.SubCategory\">\n<NavigationPropertyBinding Path=\"MainCategory\" Target=\"dataexposure.epmshop.EntityContainer_52E5CAF81DF84C9CAEA930D6D6D51B17/MainCategory\"/>\n</EntitySet>\n<EntitySet Name=\"Product\" EntityType=\"dataexposure.epmshop.Product\">\n<NavigationPropertyBinding Path=\"SubCategory\" Target=\"dataexposure.epmshop.EntityContainer_52E5CAF81DF84C9CAEA930D6D6D51B17/SubCategory\"/>\n<NavigationPropertyBinding Path=\"Supplier\" Target=\"dataexposure.epmshop.EntityContainer_52E5CAF81DF84C9CAEA930D6D6D51B17/Supplier\"/>\n<NavigationPropertyBinding Path=\"Reviews\" Target=\"dataexposure.epmshop.EntityContainer_52E5CAF81DF84C9CAEA930D6D6D51B17/Review\"/>\n<NavigationPropertyBinding Path=\"Images\" Target=\"dataexposure.epmshop.EntityContainer_52E5CAF81DF84C9CAEA930D6D6D51B17/Image\"/>\n<NavigationPropertyBinding Path=\"PrimaryImage\" Target=\"dataexposure.epmshop.EntityContainer_52E5CAF81DF84C9CAEA930D6D6D51B17/Image\"/>\n</EntitySet>\n<EntitySet Name=\"ShoppingCartItem\" EntityType=\"dataexposure.epmshop.ShoppingCartItem\">\n<NavigationPropertyBinding Path=\"Product\" Target=\"dataexposure.epmshop.EntityContainer_52E5CAF81DF84C9CAEA930D6D6D51B17/Product\"/>\n</EntitySet>\n<EntitySet Name=\"Supplier\" EntityType=\"dataexposure.epmshop.Supplier\"/>\n<EntitySet Name=\"Review\" EntityType=\"dataexposure.epmshop.Review\"/>\n<EntitySet Name=\"Image\" EntityType=\"dataexposure.epmshop.Image\"/>\n<EntitySet Name=\"MainCategory\" EntityType=\"dataexposure.epmshop.MainCategory\">\n<NavigationPropertyBinding Path=\"SubCategories\" Target=\"dataexposure.epmshop.EntityContainer_52E5CAF81DF84C9CAEA930D6D6D51B17/SubCategory\"/>\n</EntitySet>\n<ActionImport Name=\"AddProductToShoppingCart\" Action=\"dataexposure.epmshop.AddProductToShoppingCart\"/>\n<ActionImport Name=\"BuyShoppingCart\" Action=\"dataexposure.epmshop.BuyShoppingCart\"/>\n<ActionImport Name=\"ResetShop\" Action=\"dataexposure.epmshop.ResetShop\"/>\n</EntityContainer>\n</Schema>\n</edmx:DataServices>\n</edmx:Edmx>\n"

    internal static let parsed: CSDLDocument = ShopServiceMetadata.parse()

    public static let document: CSDLDocument = ShopServiceMetadata.resolve()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = (CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)
        return parser.parseInProxy(ShopServiceMetadata.source, url: "dataexposure.epmshop")
    }

    static func resolve() -> CSDLDocument {
        ShopServiceMetadata.EntityTypes.image.registerFactory(ObjectFactory.with(create: { Image() }))
        ShopServiceMetadata.EntityTypes.mainCategory.registerFactory(ObjectFactory.with(create: { MainCategory() }))
        ShopServiceMetadata.EntityTypes.product.registerFactory(ObjectFactory.with(create: { Product() }))
        ShopServiceMetadata.EntityTypes.review.registerFactory(ObjectFactory.with(create: { Review() }))
        ShopServiceMetadata.EntityTypes.shoppingCart.registerFactory(ObjectFactory.with(create: { ShoppingCart() }))
        ShopServiceMetadata.EntityTypes.shoppingCartItem.registerFactory(ObjectFactory.with(create: { ShoppingCartItem() }))
        ShopServiceMetadata.EntityTypes.subCategory.registerFactory(ObjectFactory.with(create: { SubCategory() }))
        ShopServiceMetadata.EntityTypes.supplier.registerFactory(ObjectFactory.with(create: { Supplier() }))
        return ShopServiceMetadata.parsed
    }

    public class EntityTypes {
        public static let image: EntityType = ShopServiceMetadata.parsed.entityType(withName: "dataexposure.epmshop.Image")

        public static let mainCategory: EntityType = ShopServiceMetadata.parsed.entityType(withName: "dataexposure.epmshop.MainCategory")

        public static let product: EntityType = ShopServiceMetadata.parsed.entityType(withName: "dataexposure.epmshop.Product")

        public static let review: EntityType = ShopServiceMetadata.parsed.entityType(withName: "dataexposure.epmshop.Review")

        public static let shoppingCart: EntityType = ShopServiceMetadata.parsed.entityType(withName: "dataexposure.epmshop.ShoppingCart")

        public static let shoppingCartItem: EntityType = ShopServiceMetadata.parsed.entityType(withName: "dataexposure.epmshop.ShoppingCartItem")

        public static let subCategory: EntityType = ShopServiceMetadata.parsed.entityType(withName: "dataexposure.epmshop.SubCategory")

        public static let supplier: EntityType = ShopServiceMetadata.parsed.entityType(withName: "dataexposure.epmshop.Supplier")
    }

    public class EntitySets {
        public static let image: EntitySet = ShopServiceMetadata.parsed.entitySet(withName: "Image")

        public static let mainCategory: EntitySet = ShopServiceMetadata.parsed.entitySet(withName: "MainCategory")

        public static let product: EntitySet = ShopServiceMetadata.parsed.entitySet(withName: "Product")

        public static let review: EntitySet = ShopServiceMetadata.parsed.entitySet(withName: "Review")

        public static let shoppingCart: EntitySet = ShopServiceMetadata.parsed.entitySet(withName: "ShoppingCart")

        public static let shoppingCartItem: EntitySet = ShopServiceMetadata.parsed.entitySet(withName: "ShoppingCartItem")

        public static let subCategory: EntitySet = ShopServiceMetadata.parsed.entitySet(withName: "SubCategory")

        public static let supplier: EntitySet = ShopServiceMetadata.parsed.entitySet(withName: "Supplier")
    }

    public class ActionImports {
        public static let addProductToShoppingCart: DataMethod = ShopServiceMetadata.parsed.dataMethod(withName: "AddProductToShoppingCart")

        public static let buyShoppingCart: DataMethod = ShopServiceMetadata.parsed.dataMethod(withName: "BuyShoppingCart")

        public static let resetShop: DataMethod = ShopServiceMetadata.parsed.dataMethod(withName: "ResetShop")
    }
}

open class ShoppingCart: EntityValue {
    public static let id: Property = ShopServiceMetadata.EntityTypes.shoppingCart.property(withName: "Id")

    public static let total: Property = ShopServiceMetadata.EntityTypes.shoppingCart.property(withName: "Total")

    public static let currencyCode: Property = ShopServiceMetadata.EntityTypes.shoppingCart.property(withName: "CurrencyCode")

    public static let totalQuantity: Property = ShopServiceMetadata.EntityTypes.shoppingCart.property(withName: "TotalQuantity")

    public static let formattedCustomerName: Property = ShopServiceMetadata.EntityTypes.shoppingCart.property(withName: "FormattedCustomerName")

    public static let formattedAddress: Property = ShopServiceMetadata.EntityTypes.shoppingCart.property(withName: "FormattedAddress")

    public static let logonName: Property = ShopServiceMetadata.EntityTypes.shoppingCart.property(withName: "LogonName")

    public static let shoppingCartItems: Property = ShopServiceMetadata.EntityTypes.shoppingCart.property(withName: "ShoppingCartItems")

    public init() {
        super.init(type: ShopServiceMetadata.EntityTypes.shoppingCart)
    }

    open class func array(from: EntityValueList) -> Array<ShoppingCart> {
        return ArrayConverter.convert(from.toArray(), Array<ShoppingCart>())
    }

    open func copy() -> ShoppingCart {
        return CastRequired<ShoppingCart>.from(self.copyEntity())
    }

    open var currencyCode: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ShoppingCart.currencyCode))
        }
        set(value) {
            self.setDataValue(for: ShoppingCart.currencyCode, to: StringValue.of(value))
        }
    }

    open var formattedAddress: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ShoppingCart.formattedAddress))
        }
        set(value) {
            self.setDataValue(for: ShoppingCart.formattedAddress, to: StringValue.of(value))
        }
    }

    open var formattedCustomerName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ShoppingCart.formattedCustomerName))
        }
        set(value) {
            self.setDataValue(for: ShoppingCart.formattedCustomerName, to: StringValue.of(value))
        }
    }

    open var id: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: ShoppingCart.id))
        }
        set(value) {
            self.setDataValue(for: ShoppingCart.id, to: IntValue.of(value))
        }
    }

    open class func key(id: Int) -> EntityKey {
        return EntityKey().with(name: "Id", value: IntValue.of(id))
    }

    open var logonName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ShoppingCart.logonName))
        }
        set(value) {
            self.setDataValue(for: ShoppingCart.logonName, to: StringValue.of(value))
        }
    }

    open var old: ShoppingCart {
        get {
            return CastRequired<ShoppingCart>.from(self.oldEntity)
        }
    }

    open var shoppingCartItems: Array<ShoppingCartItem> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: ShoppingCart.shoppingCartItems)).toArray(), Array<ShoppingCartItem>())
        }
        set(value) {
            ShoppingCart.shoppingCartItems.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var total: BigDecimal {
        get {
            return DecimalValue.unwrap(self.dataValue(for: ShoppingCart.total))
        }
        set(value) {
            self.setDataValue(for: ShoppingCart.total, to: DecimalValue.of(value))
        }
    }

    open var totalQuantity: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: ShoppingCart.totalQuantity))
        }
        set(value) {
            self.setDataValue(for: ShoppingCart.totalQuantity, to: IntValue.of(value))
        }
    }
}

open class ShoppingCartItem: EntityValue {
    public static let shoppingCartID: Property = ShopServiceMetadata.EntityTypes.shoppingCartItem.property(withName: "ShoppingCartId")

    public static let id: Property = ShopServiceMetadata.EntityTypes.shoppingCartItem.property(withName: "Id")

    public static let productID: Property = ShopServiceMetadata.EntityTypes.shoppingCartItem.property(withName: "ProductId")

    public static let quantity: Property = ShopServiceMetadata.EntityTypes.shoppingCartItem.property(withName: "Quantity")

    public static let unit: Property = ShopServiceMetadata.EntityTypes.shoppingCartItem.property(withName: "Unit")

    public static let subTotal: Property = ShopServiceMetadata.EntityTypes.shoppingCartItem.property(withName: "SubTotal")

    public static let currencyCode: Property = ShopServiceMetadata.EntityTypes.shoppingCartItem.property(withName: "CurrencyCode")

    public static let product: Property = ShopServiceMetadata.EntityTypes.shoppingCartItem.property(withName: "Product")

    public init() {
        super.init(type: ShopServiceMetadata.EntityTypes.shoppingCartItem)
    }

    open class func array(from: EntityValueList) -> Array<ShoppingCartItem> {
        return ArrayConverter.convert(from.toArray(), Array<ShoppingCartItem>())
    }

    open func copy() -> ShoppingCartItem {
        return CastRequired<ShoppingCartItem>.from(self.copyEntity())
    }

    open var currencyCode: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ShoppingCartItem.currencyCode))
        }
        set(value) {
            self.setDataValue(for: ShoppingCartItem.currencyCode, to: StringValue.of(value))
        }
    }

    open var id: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ShoppingCartItem.id))
        }
        set(value) {
            self.setDataValue(for: ShoppingCartItem.id, to: StringValue.of(value))
        }
    }

    open class func key(shoppingCartID: Int, id: String) -> EntityKey {
        return EntityKey().with(name: "ShoppingCartId", value: IntValue.of(shoppingCartID)).with(name: "Id", value: StringValue.of(id))
    }

    open var old: ShoppingCartItem {
        get {
            return CastRequired<ShoppingCartItem>.from(self.oldEntity)
        }
    }

    open var product: Product? {
        get {
            return CastOptional<Product>.from(self.dataValue(for: ShoppingCartItem.product))
        }
        set(value) {
            self.setDataValue(for: ShoppingCartItem.product, to: value)
        }
    }

    open var productID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ShoppingCartItem.productID))
        }
        set(value) {
            self.setDataValue(for: ShoppingCartItem.productID, to: StringValue.of(value))
        }
    }

    open var quantity: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: ShoppingCartItem.quantity))
        }
        set(value) {
            self.setDataValue(for: ShoppingCartItem.quantity, to: IntValue.of(value))
        }
    }

    open var shoppingCartID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: ShoppingCartItem.shoppingCartID))
        }
        set(value) {
            self.setDataValue(for: ShoppingCartItem.shoppingCartID, to: IntValue.of(value))
        }
    }

    open var subTotal: BigDecimal {
        get {
            return DecimalValue.unwrap(self.dataValue(for: ShoppingCartItem.subTotal))
        }
        set(value) {
            self.setDataValue(for: ShoppingCartItem.subTotal, to: DecimalValue.of(value))
        }
    }

    open var unit: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ShoppingCartItem.unit))
        }
        set(value) {
            self.setDataValue(for: ShoppingCartItem.unit, to: StringValue.of(value))
        }
    }
}

open class SubCategory: EntityValue {
    public static let id: Property = ShopServiceMetadata.EntityTypes.subCategory.property(withName: "Id")

    public static let name: Property = ShopServiceMetadata.EntityTypes.subCategory.property(withName: "Name")

    public static let mainCategoryID: Property = ShopServiceMetadata.EntityTypes.subCategory.property(withName: "MainCategoryId")

    public static let mainCategoryName: Property = ShopServiceMetadata.EntityTypes.subCategory.property(withName: "MainCategoryName")

    public static let mainCategory: Property = ShopServiceMetadata.EntityTypes.subCategory.property(withName: "MainCategory")

    public init() {
        super.init(type: ShopServiceMetadata.EntityTypes.subCategory)
    }

    open class func array(from: EntityValueList) -> Array<SubCategory> {
        return ArrayConverter.convert(from.toArray(), Array<SubCategory>())
    }

    open func copy() -> SubCategory {
        return CastRequired<SubCategory>.from(self.copyEntity())
    }

    open var id: String {
        get {
            return StringValue.unwrap(self.dataValue(for: SubCategory.id))
        }
        set(value) {
            self.setDataValue(for: SubCategory.id, to: StringValue.of(value))
        }
    }

    open class func key(id: String) -> EntityKey {
        return EntityKey().with(name: "Id", value: StringValue.of(id))
    }

    open var mainCategory: MainCategory {
        get {
            return CastRequired<MainCategory>.from(self.dataValue(for: SubCategory.mainCategory))
        }
        set(value) {
            self.setDataValue(for: SubCategory.mainCategory, to: value)
        }
    }

    open var mainCategoryID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: SubCategory.mainCategoryID))
        }
        set(value) {
            self.setDataValue(for: SubCategory.mainCategoryID, to: StringValue.of(value))
        }
    }

    open var mainCategoryName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: SubCategory.mainCategoryName))
        }
        set(value) {
            self.setDataValue(for: SubCategory.mainCategoryName, to: StringValue.of(value))
        }
    }

    open var name: String {
        get {
            return StringValue.unwrap(self.dataValue(for: SubCategory.name))
        }
        set(value) {
            self.setDataValue(for: SubCategory.name, to: StringValue.of(value))
        }
    }

    open var old: SubCategory {
        get {
            return CastRequired<SubCategory>.from(self.oldEntity)
        }
    }
}

open class Supplier: EntityValue {
    public static let id: Property = ShopServiceMetadata.EntityTypes.supplier.property(withName: "Id")

    public static let name: Property = ShopServiceMetadata.EntityTypes.supplier.property(withName: "Name")

    public static let phone: Property = ShopServiceMetadata.EntityTypes.supplier.property(withName: "Phone")

    public static let email: Property = ShopServiceMetadata.EntityTypes.supplier.property(withName: "Email")

    public static let webAddress: Property = ShopServiceMetadata.EntityTypes.supplier.property(withName: "WebAddress")

    public static let formattedAddress: Property = ShopServiceMetadata.EntityTypes.supplier.property(withName: "FormattedAddress")

    public static let formattedContactName: Property = ShopServiceMetadata.EntityTypes.supplier.property(withName: "FormattedContactName")

    public static let contactPhone1: Property = ShopServiceMetadata.EntityTypes.supplier.property(withName: "ContactPhone1")

    public static let contactPhone2: Property = ShopServiceMetadata.EntityTypes.supplier.property(withName: "ContactPhone2")

    public static let contactEmail: Property = ShopServiceMetadata.EntityTypes.supplier.property(withName: "ContactEmail")

    public init() {
        super.init(type: ShopServiceMetadata.EntityTypes.supplier)
    }

    open class func array(from: EntityValueList) -> Array<Supplier> {
        return ArrayConverter.convert(from.toArray(), Array<Supplier>())
    }

    open var contactEmail: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Supplier.contactEmail))
        }
        set(value) {
            self.setDataValue(for: Supplier.contactEmail, to: StringValue.of(value))
        }
    }

    open var contactPhone1: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Supplier.contactPhone1))
        }
        set(value) {
            self.setDataValue(for: Supplier.contactPhone1, to: StringValue.of(value))
        }
    }

    open var contactPhone2: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Supplier.contactPhone2))
        }
        set(value) {
            self.setDataValue(for: Supplier.contactPhone2, to: StringValue.of(value))
        }
    }

    open func copy() -> Supplier {
        return CastRequired<Supplier>.from(self.copyEntity())
    }

    open var email: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Supplier.email))
        }
        set(value) {
            self.setDataValue(for: Supplier.email, to: StringValue.of(value))
        }
    }

    open var formattedAddress: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Supplier.formattedAddress))
        }
        set(value) {
            self.setDataValue(for: Supplier.formattedAddress, to: StringValue.of(value))
        }
    }

    open var formattedContactName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Supplier.formattedContactName))
        }
        set(value) {
            self.setDataValue(for: Supplier.formattedContactName, to: StringValue.of(value))
        }
    }

    open var id: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Supplier.id))
        }
        set(value) {
            self.setDataValue(for: Supplier.id, to: StringValue.of(value))
        }
    }

    open class func key(id: String) -> EntityKey {
        return EntityKey().with(name: "Id", value: StringValue.of(id))
    }

    open var name: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Supplier.name))
        }
        set(value) {
            self.setDataValue(for: Supplier.name, to: StringValue.of(value))
        }
    }

    open var old: Supplier {
        get {
            return CastRequired<Supplier>.from(self.oldEntity)
        }
    }

    open var phone: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Supplier.phone))
        }
        set(value) {
            self.setDataValue(for: Supplier.phone, to: StringValue.of(value))
        }
    }

    open var webAddress: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Supplier.webAddress))
        }
        set(value) {
            self.setDataValue(for: Supplier.webAddress, to: StringValue.of(value))
        }
    }
}
