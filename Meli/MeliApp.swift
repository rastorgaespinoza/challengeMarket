//
//  MeliApp.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 05-10-23.
//

import SwiftUI

@main
struct MeliApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        ProductListPageView()
          .navigationTitle("Buscador de productos")
          .toolbarBackground(
            Color.primary100,
            for: .navigationBar
          )
          .toolbarBackground(.visible, for: .navigationBar)
      }
    }
  }
}
