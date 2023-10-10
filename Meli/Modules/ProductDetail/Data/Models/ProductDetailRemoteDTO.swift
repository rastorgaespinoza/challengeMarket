//
//  ProductDetailRemoteDTO.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

import Foundation

// MARK: - ProductDetailRemoteDTO
struct ProductDetailRemoteDTO: Codable {
  let id: String?
  let siteID: String?
  let title: String?
  let sellerID: Int?
  let categoryID: String?
  let officialStoreID: Int?
  let price: Double?
  let basePrice: Double?
  let originalPrice: Double?
  let currencyID: String?
  let initialQuantity: Int?
  let availableQuantity: Int?
  let soldQuantity: Int?
  let saleTerms: [AttributeDetailRemoteDTO]?
  let buyingMode: String?
  let listingTypeID: String?
  let startTime: String?
  let stopTime: String?
  let condition: String?
  let permalink: String?
  let thumbnailID: String?
  let thumbnail: String?
  let secureThumbnail: String?
  let pictures: [PictureDetailRemoteDTO]?
  let acceptsMercadopago: Bool?
  let shipping: ShippingDetailRemoteDTO?
  let internationalDeliveryMode: String?
  let sellerAddress: SellerAddressDetailRemoteDTO?
  let location: LocationDetailRemoteDTO?
  let attributes: [AttributeDetailRemoteDTO]?
  let listingSource: String?
  let status: String?
  let tags: [String]?
  let warranty: String?
  let catalogProductID: String?
  let domainID: String?
  let dealIDS: [String]?
  let automaticRelist: Bool?
  let dateCreated: String?
  let lastUpdated: String?
  let health: Int?
  let channels: [String]?

  enum CodingKeys: String, CodingKey {
    case id
    case siteID = "site_id"
    case title
    case sellerID = "seller_id"
    case categoryID = "category_id"
    case officialStoreID = "official_store_id"
    case price
    case basePrice = "base_price"
    case originalPrice = "original_price"
    case currencyID = "currency_id"
    case initialQuantity = "initial_quantity"
    case availableQuantity = "available_quantity"
    case soldQuantity = "sold_quantity"
    case saleTerms = "sale_terms"
    case buyingMode = "buying_mode"
    case listingTypeID = "listing_type_id"
    case startTime = "start_time"
    case stopTime = "stop_time"
    case condition
    case permalink
    case thumbnailID = "thumbnail_id"
    case thumbnail
    case secureThumbnail = "secure_thumbnail"
    case pictures
    case acceptsMercadopago = "accepts_mercadopago"
    case shipping
    case internationalDeliveryMode = "international_delivery_mode"
    case sellerAddress = "seller_address"
    case location
    case attributes
    case listingSource = "listing_source"
    case status
    case tags, warranty
    case catalogProductID = "catalog_product_id"
    case domainID = "domain_id"
    case dealIDS = "deal_ids"
    case automaticRelist = "automatic_relist"
    case dateCreated = "date_created"
    case lastUpdated = "last_updated"
    case health
    case channels
  }
}

// MARK: - Attribute
struct AttributeDetailRemoteDTO: Codable {
  let id: String?
  let name: String?
  let valueID: String?
  let valueName: String?
  let valueStruct: StructDetailRemoteDTO?
  let values: [ValueDetailRemoteDTO]?
  let attributeGroupID: String?
  let attributeGroupName: String?
  let valueType: String?

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case valueID = "value_id"
    case valueName = "value_name"
    case valueStruct = "value_struct"
    case values
    case attributeGroupID = "attribute_group_id"
    case attributeGroupName = "attribute_group_name"
    case valueType = "value_type"
  }
}


// MARK: - Struct
struct StructDetailRemoteDTO: Codable {
  let number: Double?
  let unit: String?
}

// MARK: - Value
struct ValueDetailRemoteDTO: Codable {
  let id: String?
  let name: String?
  let valueStruct: StructDetailRemoteDTO?

  enum CodingKeys: String, CodingKey {
    case id, name
    case valueStruct = "struct"
  }
}

// MARK: - Location
struct LocationDetailRemoteDTO: Codable {
}

// MARK: - Picture
struct PictureDetailRemoteDTO: Codable {
  let id: String?
  let url: String?
  let secureURL: String?
  let size: String?
  let maxSize: String?
  let quality: String?

  enum CodingKeys: String, CodingKey {
    case id
    case url
    case secureURL = "secure_url"
    case size
    case maxSize = "max_size"
    case quality
  }
}

// MARK: - SellerAddress
struct SellerAddressDetailRemoteDTO: Codable {
  let city: CityDetailRemoteDTO?
  let state: CityDetailRemoteDTO?
  let country: CityDetailRemoteDTO?
  let searchLocation: SearchLocationDetailRemoteDTO?
  let id: Int?

  enum CodingKeys: String, CodingKey {
    case city
    case state
    case country
    case searchLocation = "search_location"
    case id
  }
}

// MARK: - City
struct CityDetailRemoteDTO: Codable {
  let id: String?
  let name: String?
}

// MARK: - SearchLocation
struct SearchLocationDetailRemoteDTO: Codable {
  let neighborhood: CityDetailRemoteDTO?
  let city: CityDetailRemoteDTO?
  let state: CityDetailRemoteDTO?
}

// MARK: - Shipping
struct ShippingDetailRemoteDTO: Codable {
  let mode: String?
  let tags: [String]?
  let localPickUp: Bool?
  let freeShipping: Bool?
  let logisticType: String?
  let storePickUp: Bool?

  enum CodingKeys: String, CodingKey {
    case mode
    case tags
    case localPickUp = "local_pick_up"
    case freeShipping = "free_shipping"
    case logisticType = "logistic_type"
    case storePickUp = "store_pick_up"
  }
}
