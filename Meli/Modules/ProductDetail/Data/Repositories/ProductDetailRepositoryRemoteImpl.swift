//
//  ProductDetailRepositoryRemoteImpl.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

import Combine
import Foundation

final class ProductDetailRepositoryRemoteImpl: ProductDetailRepository {
  private var url: URL
  private let client: HTTPClient

  enum Error: Swift.Error {
    case invalidData
  }

  init(url: URL, client: HTTPClient) {
    self.client = client
    self.url = url
  }

  func getDetail(itemId: String) -> AnyPublisher<Product, Swift.Error> {
    let urlWithItemID = url.appending(path: itemId)
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970

    return client.getPublisherDataTask(from: urlWithItemID)
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
      .decode(type: ProductDetailRemoteDTO.self, decoder: decoder)
      .map { ProductDetailRemoteMapper.map($0) }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }

  func getDescription(itemId: String) -> AnyPublisher<String, Swift.Error> {
    let urlWithItemID = url.appending(path: itemId).appending(path: "/description")
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970

    return client.getPublisherDataTask(from: urlWithItemID)
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
      .decode(type: ProductDetailDescriptionRemoteDTO.self, decoder: decoder)
      .map { $0.plainText }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
