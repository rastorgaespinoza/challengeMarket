//
//  ProductDetailViewModel.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine

final class ProductDetailViewModel: ObservableObject {
  let productDetailUseCase: GetProductDetailUseCase
  @Published var state: State = .neverLoading
  private var disposables = Set<AnyCancellable>()

  enum State {
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
        state = .success(product)
      })
      .store(in: &disposables)
  }
}
