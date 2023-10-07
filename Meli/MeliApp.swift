//
//  MeliApp.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 05-10-23.
//

import SwiftUI

@main
struct MeliApp: App {
  let product = ProductListRow.Product(
    id: "",
    title: "Apple iPhone 11 (64 GB) - Negro - Distribuidor autorizado",
    thumbnail: "http://http2.mlstatic.com/D_962169-MLA46153276294_052021-I.jpg",
    price: 389_990,
    originalPrice: 669_990
  )

  var body: some Scene {
    WindowGroup {
      ProductListRow(product: product)
    }
  }
}
