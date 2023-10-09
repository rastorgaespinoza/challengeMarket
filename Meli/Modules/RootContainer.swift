//
//  RootContainer.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import SwiftUI

struct RootContainer: View {
  @State private var path: [Route] = []

  var body: some View {
    NavigationStack(path: $path) {
      ProductListPageView()
        .navigationTitle("Buscador de productos")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(
          Color.primary100,
          for: .navigationBar
        )
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationDestination(for: Route.self) { route in
          switch route {
          case let .product(product):
            ProductDetailPageView(product: product)
              .navigationTitle("Detalle del producto")
              .toolbarBackground(
                Color.primary100,
                for: .navigationBar
              )
              .toolbarBackground(.visible, for: .navigationBar)
              .navigationBarTitleDisplayMode(.inline)
          case let .productFeatures(features):
            ProductDetailFeaturesView(productCharacteristics: features)
              .navigationBarTitleDisplayMode(.inline)
          default:
            EmptyView()
          }
        }
    }
  }
}

extension ProductDetailPageView {
  init(product: Product) {
    let productDetail = ProductDetailPageView.ProductDetail(
      id: product.id,
      title: product.title,
      thumbnail: product.thumbnail,
      price: product.price ?? 0,
      originalPrice: product.originalPrice,
      installments: product.installments,
      freeShipping: product.shipping?.freeShipping ?? false,
      attributes: []
    )
    self.productDetail = productDetail
  }
}

extension ProductDetailFeaturesView {
  init(productCharacteristics: [ProductAttribute]) {
    source = productCharacteristics.compactMap { Source(displayName: $0.name ?? "", value: $0.valueName ?? "") }
  }
}

enum Route: Hashable {
  case search(String)
  case product(Product)
  case productFeatures([ProductAttribute])
}
