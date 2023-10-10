//
//  SearchProductsUseCaseImpl.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine

final class SearchProductsUseCaseImpl: SearchProductsUseCase {
  private let repository: SearchProductsRepository

  init(repository: SearchProductsRepository) {
    self.repository = repository
  }

  func getProducts(query: String) -> AnyPublisher<ProductListResult, Error> {
    repository.getProducts(query: query)
  }
}
