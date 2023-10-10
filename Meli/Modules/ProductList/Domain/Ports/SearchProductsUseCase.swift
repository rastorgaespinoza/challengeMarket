//
//  SearchProductsUseCase.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine

protocol SearchProductsUseCase {
  func getProducts(query: String) -> AnyPublisher<ProductListResult, Error>
}
