//
//  View+extension.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

import SwiftUI

struct NavigationStyleModifier: ViewModifier {
  var title: String

  func body(content: Content) -> some View {
    content
      .navigationTitle(title)
      .navigationBarTitleDisplayMode(.inline)
      .toolbarRole(.editor)
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(Color.primary100, for: .navigationBar)
  }
}

extension View {
  func navigationStyleModifier(title: String) -> some View {
    modifier(NavigationStyleModifier(title: title))
    }
}
