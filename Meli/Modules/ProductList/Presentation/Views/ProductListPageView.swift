//
//  ProductListPageView.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 07-10-23.
//

import SwiftUI

struct ProductListPageView: View {
  @StateObject private var searchProductsViewModel = ProductListServiceLocator().searchProductsViewModel
  @State private var query = ""

  var body: some View {
    switch searchProductsViewModel.state {
    case .neverLoading:
      Text("nothing happens")
        .onAppear {
          searchProductsViewModel.searchProducts(query: "iphone")
        }
    case .loading:
      ProgressView()
    case .success(let products):
      ScrollView {
        VStack {
          ForEach(products) { productEntity in
            ProductListRow(productEntity: productEntity)
          }
        }
      }

//      List(products) { product in
//        ProductListRow(productEntity: product)
//      }
      .searchable(text: $query, placement: .navigationBarDrawer, prompt: "Buscar en Mercado Libre")

    case .error:
      Text("error")
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
      originalPrice: productEntity.originalPrice
    )
    self.product = productRow
  }
}

#Preview {
  ProductListPageView()
}
