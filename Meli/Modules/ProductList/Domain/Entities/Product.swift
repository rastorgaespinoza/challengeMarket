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
