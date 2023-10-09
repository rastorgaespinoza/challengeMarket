//
//  GetProductDetailUseCase.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine

protocol GetProductDetailUseCase {
  func getDetail(itemId: String) -> AnyPublisher<Product, Error>
}
