//
//  HTTPClient.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine
import Foundation

protocol HTTPClient {
  typealias DataTaskOutput = URLSession.DataTaskPublisher.Output
  typealias DataTaskFailure = URLSession.DataTaskPublisher.Failure
  func getPublisherDataTask(from url: URL) -> AnyPublisher<DataTaskOutput, DataTaskFailure>
}
