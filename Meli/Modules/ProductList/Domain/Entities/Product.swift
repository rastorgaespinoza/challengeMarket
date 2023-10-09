//
//  Product.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 07-10-23.
//

struct Product: Identifiable, Hashable {
  let id: String
  let title: String
  let price: Double?
  let originalPrice: Double?
  let thumbnail: String
  let installments: Installments?
  let shipping: Shipping?
  let officialStoreName: String?
  let attributes: [ProductAttribute]
}

struct Installments: Hashable {
  let quantity: Int
  let amount: Double
  let rate: Int
  let currencyID: String
}

struct Shipping: Hashable {
  let storePickUp: Bool?
  let freeShipping: Bool?
  let logisticType: String?
  let mode: String?
  let tags: [String]?
}

struct ProductAttribute: Hashable {
  let id: String?
  let name: String?
  let valueID: String?
  let valueName: String?
  let attributeGroupID: String?
  let attributeGroupName: String?
}
