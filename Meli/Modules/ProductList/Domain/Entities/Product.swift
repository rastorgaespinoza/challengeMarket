//
//  Product.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 07-10-23.
//

struct Product: Identifiable {
  let id: String
  let title: String
  let price: Double?
  let originalPrice: Double?
  let thumbnail: String
  let installments: Installments?
  let shipping: Shipping?
}

struct Installments {
  let quantity: Int
  let amount: Double
  let rate: Int
  let currencyID: String
}

struct Shipping {
  let storePickUp: Bool?
  let freeShipping: Bool?
  let logisticType: String?
  let mode: String?
  let tags: [String]?
}
