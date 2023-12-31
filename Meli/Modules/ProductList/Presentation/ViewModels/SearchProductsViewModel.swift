//
//  SearchProductsViewModel.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Combine

final class SearchProductsViewModel: ObservableObject {
  let searchUseCase: SearchProductsUseCase
  @Published var state: State = .neverLoading
  private var disposables = Set<AnyCancellable>()

  enum State {
    case neverLoading
    case loading
    case success(ProductListResult)
    case error
  }

  init(searchUseCase: SearchProductsUseCase) {
    self.searchUseCase = searchUseCase
  }

  deinit {
    disposables.forEach { $0.cancel() }
  }

  func searchProducts(query: String) {
    state = .loading
    let query = query.trimmed.lowercased()
    searchUseCase.getProducts(query: query)
      .sink(receiveCompletion: { [weak self] completion in
        guard let self = self else { return }
        if case .failure = completion {
          self.state = .error
        }
      }, receiveValue: { [weak self] productListResult in
        guard let self = self else { return }
        self.state = .success(productListResult)
      })
      .store(in: &disposables)
  }
}
