//
//  SearchProductsRepository.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine

protocol SearchProductsRepository {
  func getProducts(query: String) -> AnyPublisher<ProductListResult, Error>
}
