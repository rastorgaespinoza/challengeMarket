//
//  ProductListErrorView.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

import SwiftUI

struct ProductListErrorView: View {
  typealias ActionError = () -> Void
  var action: ActionError?
  var body: some View {
    VStack(spacing: 16) {
      Spacer()
      Image("illustrationError")
        .resizable()
        .scaledToFit()
        .frame(maxWidth: 240)

      Text("¡Parece que no hay Internet!")
        .customFont(.regular, size: 20)
      
      Text("Revisa tu conexión para seguir navegando.")
        .customFont(.light, size: 16)
      
      Spacer()
      Button(action: {
        action?()
      }, label: {
        Text("Reintentar")
          .customFont(.regular, size: 16)
          .foregroundColor(.link100)
      })
      Spacer()
    }
    .padding()
    .foregroundStyle(.neutral200)
  }
}

#if DEBUG
#Preview {
  ProductListErrorView()
}
#endif
