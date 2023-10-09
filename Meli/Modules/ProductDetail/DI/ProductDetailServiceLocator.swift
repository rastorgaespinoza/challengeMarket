//
//  ProductDetailServiceLocator.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

import Foundation

final class ProductDetailServiceLocator {
  private var urlSessionHttpClient: HTTPClient {
    URLSessionHTTPClient()
  }

  private var productDetailRepositoryRemoteImpl: ProductDetailRepository {
    let urlAPI = "https://api.mercadolibre.com/items/"
    let url = URL(string: urlAPI)!

    return ProductDetailRepositoryRemoteImpl(url: url, client: urlSessionHttpClient)
  }

  private var getProductDetailUseCaseImpl: GetProductDetailUseCase {
    GetProductDetailUseCaseImpl(repository: productDetailRepositoryRemoteImpl)
  }

  private var getProductDescriptionUseCaseImpl: GetProductDescriptionUseCase {
    GetProductDescriptionUseCaseImpl(repository: productDetailRepositoryRemoteImpl)
  }

  var productDetailViewModel: ProductDetailViewModel {
    ProductDetailViewModel(
      productDetailUseCase: getProductDetailUseCaseImpl,
      productDescriptionUseCase: getProductDescriptionUseCaseImpl
    )
  }
}
