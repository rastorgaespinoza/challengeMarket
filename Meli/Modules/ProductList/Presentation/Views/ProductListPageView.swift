//
//  ProductListPageView.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 07-10-23.
//

import SwiftUI

struct ProductListPageView: View {
  @StateObject private var searchProductsViewModel = ProductListServiceLocator().searchProductsViewModel
  @State private var query = "iphone"

  var body: some View {
    VStack {
      switch searchProductsViewModel.state {
      case .neverLoading:
        Text("")
          .onAppear {
            searchProductsViewModel.searchProducts(query: query)
          }
      case .loading:
        ProgressView()
      case .success(let products):
        ScrollView {
          LazyVStack(spacing: 10) {
            ForEach(products) { productEntity in
              NavigationLink(value: Route.product(productEntity)) {
                ProductListRow(productEntity: productEntity)
              }

              if productEntity != products.last {
                Divider()
              }
            }
          }
          .padding(.top, 10)
        }
        .searchable(text: $query, placement: .navigationBarDrawer, prompt: "Buscar en Mercado Libre")

      case .error:
        Text("error")
      }
    }
    .onSubmit(of: .search) {
      searchProductsViewModel.searchProducts(query: query)
    }

  }
}

extension ProductListRow {
  init(productEntity: Product) {
    let productRow = ProductListRow.ProductRow(
      id: productEntity.id,
      title: productEntity.title,
      thumbnail: productEntity.thumbnail,
      price: productEntity.price ?? 0.0,
      originalPrice: productEntity.originalPrice,
      installments: productEntity.installments,
      freeShipping: productEntity.shipping?.freeShipping ?? false,
      officialStoreName: productEntity.officialStoreName
    )
    self.product = productRow
  }
}

#Preview {
  ProductListPageView()
}
