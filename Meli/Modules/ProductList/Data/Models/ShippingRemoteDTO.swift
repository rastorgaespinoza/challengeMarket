//
//  ShippingRemoteDTO.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

struct ShippingRemoteDTO: Codable {
  let storePickUp: Bool?
  let freeShipping: Bool?
  let logisticType: String?
  let mode: String?
  let tags: [String]?

  enum CodingKeys: String, CodingKey {
    case storePickUp = "store_pick_up"
    case freeShipping = "free_shipping"
    case logisticType = "logistic_type"
    case mode
    case tags
  }
}
