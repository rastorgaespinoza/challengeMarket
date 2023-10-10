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
  let thumbnail: String?
  let currencyID: String?
  let price: Double?
  let originalPrice: Double?
  let soldQuantity: Int?
  let officialStoreName: String?
  let acceptsMercadopago: Bool?
  let tags: [String]?
  let shipping: ShippingRemoteDTO?
  let seller: SellerRemoteDTO?
  let attributes: [AttributeRemoteDTO]?
  let installments: InstallmentsRemoteDTO?

  enum CodingKeys: String, CodingKey {
    case id
    case title
    case condition
    case thumbnail
    case currencyID = "currency_id"
    case price
    case originalPrice = "original_price"
    case soldQuantity = "sold_quantity"
    case officialStoreName = "official_store_name"
    case acceptsMercadopago = "accepts_mercadopago"
    case tags
    case shipping
    case seller
    case attributes
    case installments
  }
}
