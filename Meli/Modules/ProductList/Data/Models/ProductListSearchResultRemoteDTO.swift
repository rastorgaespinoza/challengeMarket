//
//  ProductListSearchResultRemoteDTO.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

struct ProductListSearchResultRemoteDTO: Decodable {
  let paging: PagingRemoteDTO?
  let results: [ProductRemoteDTO]?
}

struct PagingRemoteDTO: Decodable {
  let total: Int?
  let primaryResults: Int?
  let offset: Int?
  let limit: Int?
}
