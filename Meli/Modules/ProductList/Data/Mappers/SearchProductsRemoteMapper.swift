//
//  SearchProductsRemoteMapper.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Foundation

final class SearchProductsRemoteMapper {
  private struct Root: Decodable {
    let items: [ProductRemoteDTO]
  }

  private static var OK_200: Int {
    return 200
  }

  internal static func map(_ data: Data, response: HTTPURLResponse) throws -> [ProductRemoteDTO] {
    guard response.statusCode == OK_200, let root = try? JSONDecoder().decode(Root.self, from: data) else {
      throw SearchProductsRepositoryRemoteImpl.Error.invalidData
    }

    return root.items
  }
}
