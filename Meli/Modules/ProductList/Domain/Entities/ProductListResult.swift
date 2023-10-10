//
//  ProductListResult.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 10-10-23.
//

import Foundation

struct ProductListResult: Hashable, Equatable {
  let paging: Paging
  let results: [Product]
}

struct Paging: Hashable, Equatable {
  let total: Int
  let primaryResults: Int
  let offset: Int
  let limit: Int
}
