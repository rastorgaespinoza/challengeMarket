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
  let price: Double?
  let basePrice: Double?
  let originalPrice: Double?
  let currencyID: String?
  let initialQuantity: Int?
  let availableQuantity: Int?
  let soldQuantity: Int?
  let saleTerms: [AttributeDetailRemoteDTO]?
  let condition: String?
  let thumbnail: String?
  let secureThumbnail: String?
  let pictures: [PictureDetailRemoteDTO]?
  let acceptsMercadopago: Bool?
  let shipping: ShippingDetailRemoteDTO?
  let internationalDeliveryMode: String?
  let attributes: [AttributeDetailRemoteDTO]?
  let tags: [String]?
  let channels: [String]?

  enum CodingKeys: String, CodingKey {
    case id
    case siteID = "site_id"
    case title
    case price
    case basePrice = "base_price"
    case originalPrice = "original_price"
    case currencyID = "currency_id"
    case initialQuantity = "initial_quantity"
    case availableQuantity = "available_quantity"
    case soldQuantity = "sold_quantity"
    case saleTerms = "sale_terms"
    case condition
    case thumbnail
    case secureThumbnail = "secure_thumbnail"
    case pictures
    case acceptsMercadopago = "accepts_mercadopago"
    case shipping
    case internationalDeliveryMode = "international_delivery_mode"
    case attributes
    case tags
    case channels
  }
}

// MARK: - Attribute
struct AttributeDetailRemoteDTO: Codable {
  let id: String?
  let name: String?
  let valueName: String?
  let attributeGroupID: String?
  let attributeGroupName: String?
  let valueType: String?

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case valueName = "value_name"
    case attributeGroupID = "attribute_group_id"
    case attributeGroupName = "attribute_group_name"
    case valueType = "value_type"
  }
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
