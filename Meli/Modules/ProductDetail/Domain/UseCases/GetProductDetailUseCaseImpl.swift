//
//  GetProductDetailUseCaseImpl.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine

final class GetProductDetailUseCaseImpl: GetProductDetailUseCase {
  private let repository: ProductDetailRepository

  init(repository: ProductDetailRepository) {
    self.repository = repository
  }

  func getDetail(itemId: String) -> AnyPublisher<Product, Error> {
    repository.getDetail(itemId: itemId)
  }
}
