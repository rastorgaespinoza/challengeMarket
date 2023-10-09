//
//  ProductDetailViewModel.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine
import Foundation

final class ProductDetailViewModel: ObservableObject {
  private let productDetailUseCase: GetProductDetailUseCase
  private let productDescriptionUseCase: GetProductDescriptionUseCase
  @Published private(set) var state: DetailState = .neverLoading
  @Published private(set) var stateDescription: DescriptionState = .neverLoading
  private var disposables = Set<AnyCancellable>()

  enum DetailState: Equatable {
    case neverLoading
    case loading
    case success(Product)
    case error
  }

  enum DescriptionState: Equatable {
    case neverLoading
    case loading
    case success(String)
    case error
  }

  init(productDetailUseCase: GetProductDetailUseCase, productDescriptionUseCase: GetProductDescriptionUseCase) {
    self.productDetailUseCase = productDetailUseCase
    self.productDescriptionUseCase = productDescriptionUseCase
  }

  deinit {
    disposables.forEach { $0.cancel() }
  }

  func getProductDetail(itemId: String) {
    state = .loading

    productDetailUseCase.getDetail(itemId: itemId)
      .sink(receiveCompletion: { [weak self] completion in
        guard let self = self else { return }
        if case .failure = completion {
          self.state = .error
        }
      }, receiveValue: { [weak self] product in
        guard let self = self else { return }
        self.state = .success(product)
      })
      .store(in: &disposables)
  }

  func getProductDescription(itemId: String) {
    stateDescription = .loading

    productDescriptionUseCase.getDescription(itemId: itemId)
      .sink(receiveCompletion: { [weak self] completion in
        guard let self = self else { return }
        if case .failure = completion {
          self.stateDescription = .error
        }
      }, receiveValue: { [weak self] description in
        guard let self = self else { return }
        self.stateDescription = .success(description)
      })
      .store(in: &disposables)
  }
}
