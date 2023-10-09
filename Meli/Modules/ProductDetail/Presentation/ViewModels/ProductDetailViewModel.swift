//
//  ProductDetailViewModel.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine
import Foundation

final class ProductDetailViewModel: ObservableObject {
  let productDetailUseCase: GetProductDetailUseCase
  @Published private(set) var state: DetailState = .neverLoading
  private var disposables = Set<AnyCancellable>()

  enum DetailState: Equatable {
    case neverLoading
    case loading
    case success(Product)
    case error
  }

  init(productDetailUseCase: GetProductDetailUseCase) {
    self.productDetailUseCase = productDetailUseCase
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
}
