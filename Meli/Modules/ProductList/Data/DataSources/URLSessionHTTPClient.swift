//
//  URLSessionHTTPClient.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine
import Foundation

final class URLSessionHTTPClient: HTTPClient {
  private let session: URLSession

  init(session: URLSession = .shared) {
    self.session = session
  }

  func getPublisherDataTask(from url: URL) -> AnyPublisher<HTTPClient.DataTaskOutput, HTTPClient.DataTaskFailure> {
    return session.dataTaskPublisher(for: url)
      .eraseToAnyPublisher()
  }
}
