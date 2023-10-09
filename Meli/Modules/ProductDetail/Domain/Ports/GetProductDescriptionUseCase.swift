//
//  GetProductDescriptionUseCase.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

import Combine

protocol GetProductDescriptionUseCase {
  func getDescription(itemId: String) -> AnyPublisher<String, Error>
}
