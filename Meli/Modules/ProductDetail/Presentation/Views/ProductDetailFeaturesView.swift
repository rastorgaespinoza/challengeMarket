//
//  ProductDetailFeaturesView.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

import SwiftUI

struct ProductDetailFeaturesView: View {
  let source: [Source]
  private let widthScreen = UIScreen.main.bounds.width
  private var isBigScreen: Bool {
    return widthScreen > 375
  }

  init(source: [Source]) {
    self.source = source
  }

  struct Source {
    let displayName: String
    let value: String
  }

  var body: some View {
    ScrollView {
      getGeneralCharacteristicsPDP(self.source)
    }
    .padding(.horizontal, 16)
    .padding(.bottom, 4)
  }
}

extension ProductDetailFeaturesView {
  private func getGeneralCharacteristicsPDP(_ data: [Source]) -> some View {
    return VStack(alignment: .leading, spacing: 0) {
      Text("Características del producto")
        .customFont(.regular, size: 14)
        .foregroundColor(.neutral100)
        .padding()

      ForEach(0 ..< data.count, id: \.self) { index in
        HStack {
          if data.indices.contains(index) {
            Text("\(data[index].displayName)")
              .customFont(.regular, size: 12)
              .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            Text("\(data[index].value)")
              .customFont(.regular, size: 12)
              .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()
          }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding()
        .background(backgroundColor(isOdd: (index % 2 == 0)))
      }
    }
  }

  private func backgroundColor(isOdd: Bool) -> Color {
    return isOdd ? Color(uiColor: .secondarySystemBackground) : Color(uiColor: .systemBackground)
  }
}

#if DEBUG
#Preview("Light Theme") {
  ProductDetailFeaturesView(source: ProductDetailFeaturesView.Source.previews)
    .preferredColorScheme(.light)
}

#Preview("Dark Theme") {
  ProductDetailFeaturesView(source: ProductDetailFeaturesView.Source.previews)
    .preferredColorScheme(.dark)
}
#endif
