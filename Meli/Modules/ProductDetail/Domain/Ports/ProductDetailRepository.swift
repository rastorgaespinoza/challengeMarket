//
//  ProductDetailRepository.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine

protocol ProductDetailRepository {
  func getDetail(itemId: String) -> AnyPublisher<Product, Error>
  func getDescription(itemId: String) -> AnyPublisher<String, Error>
}
