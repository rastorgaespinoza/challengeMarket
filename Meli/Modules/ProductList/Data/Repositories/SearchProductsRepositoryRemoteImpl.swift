//
//  SearchProductsRepositoryRemoteImpl.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine
import Foundation

final class SearchProductsRepositoryRemoteImpl: SearchProductsRepository {
  private var url: URL
  private let client: HTTPClient

  enum Error: Swift.Error {
    case invalidData
  }

  init(url: URL, client: HTTPClient) {
    self.client = client
    self.url = url
  }

  func getProducts(query: String) -> AnyPublisher<[Product], Swift.Error> {
    let urlWithQuery = url.appending(queryItems: [URLQueryItem(name: "q", value: query)])

    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970

    return client.getPublisherDataTask(from: urlWithQuery)
      .tryMap { element -> Data in
        guard let httpResponse = element.response as? HTTPURLResponse else {
          throw Error.invalidData
        }
        if httpResponse.statusCode == 200 {
          return element.data
        } else {
          throw Error.invalidData
        }
      }
      .decode(type: ProductListSearchResultRemoteDTO.self, decoder: decoder)
      .map { $0.results.toModels() }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
