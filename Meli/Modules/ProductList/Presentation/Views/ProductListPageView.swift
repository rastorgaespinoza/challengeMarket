//
//  ProductListPageView.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 07-10-23.
//

import SwiftUI

struct ProductListPageView: View {
  @State var query = ""
  @StateObject private var searchProductsViewModel = ProductListServiceLocator().searchProductsViewModel

  var body: some View {
    VStack {
      switch searchProductsViewModel.state {
      case .neverLoading:
        ProductListInitView()

      case .loading:
        ProgressView()

      case .success(let productListResult) where !productListResult.results.isEmpty:
        ScrollView {
          LazyVStack(spacing: 10) {
            ForEach(productListResult.results) { productEntity in
              NavigationLink(value: Route.product(productEntity)) {
                ProductListRow(productEntity: productEntity)
              }

              if productEntity != productListResult.results.last {
                Divider()
              }
            }
          }
          .padding(.top, 10)
        }

      case .success:
        ProductListEmptyView()

      case .error:
        ProductListErrorView {
          searchProductsViewModel.searchProducts(query: query)
        }
      }
    }
    .searchable(
      text: $query,
      placement: .navigationBarDrawer(displayMode: .always),
      prompt: "Buscar en Mercado Libre"
    )
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
      officialStoreName: productEntity.officialStoreName,
      isUsed: productEntity.condition.lowercased() == "used",
      isInternational: productEntity.seller?.tags?.contains("international_seller") ?? false
    )
    self.product = productRow
  }
}

#if DEBUG
#Preview {
  ProductListPageView()
}
#endif
