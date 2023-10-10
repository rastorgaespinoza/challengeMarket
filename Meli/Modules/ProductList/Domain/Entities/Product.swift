//
//  Product.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 07-10-23.
//

struct Product: Identifiable, Hashable, Equatable {
  let id: String
  let title: String
  let price: Double?
  let originalPrice: Double?
  let thumbnail: String
  let installments: Installments?
  let shipping: Shipping?
  let seller: Seller?
  let officialStoreName: String?
  let attributes: [ProductAttribute]
  let pictures: [String]
  let condition: String
}

struct Installments: Hashable, Equatable {
  let quantity: Int
  let amount: Double
  let rate: Int
  let currencyID: String
}

struct Seller: Hashable, Equatable {
  let id: Int?
  let nickname: String?
  let carDealer: Bool?
  let realEstateAgency: Bool?
  let registrationDate: String?
  let tags: [String]?
  let carDealerLogo: String?
}

struct Shipping: Hashable, Equatable {
  let storePickUp: Bool?
  let freeShipping: Bool?
  let logisticType: String?
  let mode: String?
  let tags: [String]?
}

struct ProductAttribute: Hashable, Equatable {
  let id: String?
  let name: String?
  let valueName: String?
  let attributeGroupID: String?
  let attributeGroupName: String?
}
