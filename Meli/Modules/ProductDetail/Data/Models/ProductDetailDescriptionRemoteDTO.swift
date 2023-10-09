//
//  ProductDetailDescriptionRemoteDTO.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

struct ProductDetailDescriptionRemoteDTO: Codable {
  let plainText: String

  enum CodingKeys: String, CodingKey {
    case plainText = "plain_text"
  }
}
