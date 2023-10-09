//
//  GetProductDescriptionUseCaseImpl.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

import Combine

final class GetProductDescriptionUseCaseImpl: GetProductDescriptionUseCase {
  private let repository: ProductDetailRepository

  init(repository: ProductDetailRepository) {
    self.repository = repository
  }

  func getDescription(itemId: String) -> AnyPublisher<String, Error> {
    repository.getDescription(itemId: itemId)
  }
}
