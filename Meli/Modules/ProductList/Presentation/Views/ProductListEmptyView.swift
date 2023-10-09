//
//  ProductListEmptyView.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

import SwiftUI

struct ProductListEmptyView: View {
  var body: some View {
    VStack(spacing: 16) {
      Spacer()
      Image(systemName: "magnifyingglass.circle.fill")
        .resizable()
        .frame(width: 100, height: 100)
        .foregroundColor(.neutral400)
      
      
      Text("No encontramos publicaciones")
        .customFont(.regular, size: 20)
        .customFont(.light, size: 16)
      
      Text("Revisa que la palabra esté bien escrita. También puedes probar con menos términos o más generales.")
        .customFont(.light, size: 16)
        .multilineTextAlignment(.center)
      Spacer()
    }
    .foregroundColor(.neutral200)
    .padding()
  }
}

#Preview {
  ProductListEmptyView()
}
