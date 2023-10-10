//
//  InstallmentsRemoteDTO.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

struct InstallmentsRemoteDTO: Codable {
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
