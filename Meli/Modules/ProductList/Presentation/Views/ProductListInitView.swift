//
//  ProductListInitView.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

import SwiftUI

struct ProductListInitView: View {
  var body: some View {
    VStack(spacing: 16) {
      Spacer()
      Image(systemName: "magnifyingglass.circle.fill")
        .resizable()
        .frame(width: 100, height: 100)
        .foregroundColor(.neutral400)


      Text("¿Qué estás buscando?")
        .customFont(.regular, size: 20)
        .customFont(.light, size: 16)

      Text("(Ej: iPhone 12 Pro Max, Macbook pro)")
        .customFont(.light, size: 16)
        .multilineTextAlignment(.center)
      Spacer()
    }
    .foregroundColor(.neutral200)
    .padding()
  }
}

#if DEBUG
#Preview {
  ProductListInitView()
}
#endif
