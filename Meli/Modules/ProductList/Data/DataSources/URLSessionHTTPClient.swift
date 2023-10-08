//
//  URLSessionHTTPClient.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine
import Foundation

class URLSessionHTTPClient: HTTPClient {
  private let session: URLSession

  init(session: URLSession = .shared) {
    self.session = session
  }

  private struct UnexpectedValuesRepresentation: Error {}
  
  func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) {
    session.dataTask(with: url) { data, response, error in
      completion(Result{
        if let error = error {
          throw error
        } else if let data = data, let response = response as? HTTPURLResponse {
          return (data, response)
        } else {
          throw UnexpectedValuesRepresentation()
        }
      })
    }.resume()
  }

  func getPublisherDataTask(from url: URL) -> AnyPublisher<HTTPClient.DataTaskOutput, HTTPClient.DataTaskFailure> {
    return session.dataTaskPublisher(for: url)
      .eraseToAnyPublisher()
  }
}
