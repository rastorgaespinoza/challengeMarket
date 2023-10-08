//
//  ProductListServiceLocator.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Foundation

final class ProductListServiceLocator {

  private var urlSessionHttpClient: HTTPClient {
    URLSessionHTTPClient()
  }

  private var searchProductsRepositoryRemoteImpl: SearchProductsRepository {
    let urlAPI = "https://api.mercadolibre.com/sites/MLC/search"
    let url = URL(string: urlAPI)!

    return SearchProductsRepositoryRemoteImpl(url: url, client: urlSessionHttpClient)
  }

  private var searchProductsUseCaseImpl: SearchProductsUseCase {
    SearchProductsUseCaseImpl(repository: searchProductsRepositoryRemoteImpl)
  }

  var searchProductsViewModel: SearchProductsViewModel {
    SearchProductsViewModel(searchUseCase: searchProductsUseCaseImpl)
  }
}
