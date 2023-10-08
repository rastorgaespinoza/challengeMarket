//
//  ProductRemoteDTO.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 07-10-23.
//

import Foundation

struct ProductRemoteDTO: Decodable {
  let id: String?
  let title: String?
  let condition: String?
  let thumbnailID: String?
  let catalogProductID: String?
  let listingTypeID: String?
  let permalink: String?
  let buyingMode: String?
  let siteID: String?
  let categoryID: String?
  let domainID: String?
  let thumbnail: String?
  let currencyID: String?
  let orderBackend: Int?
  let price: Double?
  let originalPrice: Double?
//  let salePrice: JSONNull?
  let soldQuantity: Int?
  let availableQuantity: Int?
  let officialStoreID: Int?
  let officialStoreName: String?
  let useThumbnailID, acceptsMercadopago: Bool?
  let tags: [String]?
  let shipping: Shipping?
  let stopTime: String?
  let seller: Seller?
  let sellerAddress: SellerAddress?
  let address: Address?
  let attributes: [Attribute]?
  let installments: Installments?
//  let winnerItemID: JSONNull?
  let catalogListing: Bool?
//  let discounts: JSONNull?
//  let promotions: [JSONAny]?
  let differentialPricing: DifferentialPricing?
  let inventoryID: String?

  enum CodingKeys: String, CodingKey {
    case id
    case title
    case condition
    case thumbnailID = "thumbnail_id"
    case catalogProductID = "catalog_product_id"
    case listingTypeID = "listing_type_id"
    case permalink
    case buyingMode = "buying_mode"
    case siteID = "site_id"
    case categoryID = "category_id"
    case domainID = "domain_id"
    case thumbnail
    case currencyID = "currency_id"
    case orderBackend = "order_backend"
    case price
    case originalPrice = "original_price"
//    case salePrice = "sale_price"
    case soldQuantity = "sold_quantity"
    case availableQuantity = "available_quantity"
    case officialStoreID = "official_store_id"
    case officialStoreName = "official_store_name"
    case useThumbnailID = "use_thumbnail_id"
    case acceptsMercadopago = "accepts_mercadopago"
    case tags, shipping
    case stopTime = "stop_time"
    case seller
    case sellerAddress = "seller_address"
    case address
    case attributes
    case installments
//    case winnerItemID = "winner_item_id"
    case catalogListing = "catalog_listing"
//    case discounts
//    case promotions
    case differentialPricing = "differential_pricing"
    case inventoryID = "inventory_id"
  }
}

// MARK: - Address
struct Address: Codable {
  let stateID: String?
  let stateName: String?
  let cityID: String?
  let cityName: String?

  enum CodingKeys: String, CodingKey {
    case stateID = "state_id"
    case stateName = "state_name"
    case cityID = "city_id"
    case cityName = "city_name"
  }
}

// MARK: - Attribute
struct Attribute: Codable {
  let id: String?
  let name: String?
  let valueID: String?
  let valueName: String?
  let attributeGroupID: String?
  let attributeGroupName: String?
  let valueStruct: Struct?
  let values: [Value]?
  let source: Int?
  let valueType: String?

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case valueID = "value_id"
    case valueName = "value_name"
    case attributeGroupID = "attribute_group_id"
    case attributeGroupName = "attribute_group_name"
    case valueStruct = "value_struct"
    case values
    case source
    case valueType = "value_type"
  }
}

// MARK: - Struct
struct Struct: Codable {
  let number: Double?
  let unit: String?
}

// MARK: - Value
struct Value: Codable {
  let id: String?
  let name: String?
  let valueStruct: Struct?
  let source: Int?

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case valueStruct = "struct"
    case source
  }
}

// MARK: - DifferentialPricing
struct DifferentialPricing: Codable {
  let id: Int?
}

// MARK: - Installments
struct Installments: Codable {
  let quantity: Int?
  let amount: Double?
  let rate: Int?
  let currencyID: String?

  enum CodingKeys: String, CodingKey {
    case quantity
    case amount
    case rate
    case currencyID = "currency_id"
  }
}

// MARK: - Seller
struct Seller: Codable {
  let id: Int?
  let nickname: String?
  let carDealer: Bool?
  let realEstateAgency: Bool?
  let empty: Bool?
  let registrationDate: String?
  let tags: [String]?
  let carDealerLogo: String?
  let permalink: String?
  let sellerReputation: SellerReputation?

  enum CodingKeys: String, CodingKey {
    case id, nickname
    case carDealer = "car_dealer"
    case realEstateAgency = "real_estate_agency"
    case empty = "_"
    case registrationDate = "registration_date"
    case tags
    case carDealerLogo = "car_dealer_logo"
    case permalink
    case sellerReputation = "seller_reputation"
  }
}

// MARK: - SellerReputation
struct SellerReputation: Codable {
  let levelID: String?
  let powerSellerStatus: String?
  let transactions: Transactions?
  let metrics: Metrics?

  enum CodingKeys: String, CodingKey {
    case levelID = "level_id"
    case powerSellerStatus = "power_seller_status"
    case transactions
    case metrics
  }
}

// MARK: - Metrics
struct Metrics: Codable {
  let sales: Sales?
  let claims: Cancellations?
  let delayedHandlingTime: Cancellations?
  let cancellations: Cancellations?

  enum CodingKeys: String, CodingKey {
    case sales
    case claims
    case delayedHandlingTime = "delayed_handling_time"
    case cancellations
  }
}

// MARK: - Cancellations
struct Cancellations: Codable {
  let period: String?
  let rate: Double?
  let value: Int?
}

// MARK: - Sales
struct Sales: Codable {
  let period: String?
  let completed: Int?
}

// MARK: - Transactions
struct Transactions: Codable {
  let canceled: Int?
  let completed: Int?
  let period: String?
  let ratings: Ratings?
  let total: Int?
}

// MARK: - Ratings
struct Ratings: Codable {
  let negative: Double?
  let neutral: Double?
  let positive: Double?
}

// MARK: - SellerAddress
struct SellerAddress: Codable {
  let comment: String?
  let addressLine: String?
  //  let id: JSONNull?
  //  let latitude: JSONNull?
  //  let longitude: JSONNull?
  let country: City?
  let state: City?
  let city: City?

  enum CodingKeys: String, CodingKey {
    case comment
    case addressLine = "address_line"
    //    case id
    //    case latitude
    //    case longitude
    case country
    case state
    case city
  }
}

// MARK: - City
struct City: Codable {
  let id: String?
  let name: String?
}

// MARK: - Shipping
struct Shipping: Codable {
  let storePickUp: Bool?
  let freeShipping: Bool?
  let logisticType: String?
  let mode: String?
  let tags: [String]?
  //  let benefits: JSONNull?
  //let promise: JSONNull?

  enum CodingKeys: String, CodingKey {
    case storePickUp = "store_pick_up"
    case freeShipping = "free_shipping"
    case logisticType = "logistic_type"
    case mode
    case tags
    //    case benefits
    //    case promise
  }
}
