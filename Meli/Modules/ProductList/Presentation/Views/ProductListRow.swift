//
//  ProductListRow.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 07-10-23.
//

import SwiftUI

struct ProductListRow: View {
  let product: ProductRow

  init(productRow: ProductRow) {
    self.product = productRow
  }

  var body: some View {
    HStack(alignment: .top, spacing: 10) {
      AsyncImage(url: product.imageURL) { phase in
        if let image = phase.image {
          image
            .resizable()
            .scaledToFit()

        } else if phase.error != nil {
          Color(uiColor: UIColor.systemBackground)

        } else {
          Color(uiColor: UIColor.systemBackground)

        }
      }
      .frame(width: 90)
      .frame(height: 90)
      .background(Color(uiColor: UIColor.secondarySystemBackground))
      .cornerRadius(8)

      VStack(alignment: .leading, spacing: 8) {
        Text(product.title)
        //Text("rating goes here")
        VStack(alignment: .leading, spacing: 2) {
          if let originalPrice = product.originalPriceFormatted {
            Text(originalPrice)
              .strikethrough()
          }

          Text(product.priceFormatted)
        }
      }

      Spacer(minLength: .zero)
    }
  }
}

extension ProductListRow {
  struct ProductRow: Identifiable {
    let id: String
    let title: String
    let thumbnail: String
    let price: Double
    let originalPrice: Double?


    var priceFormatted: String {
      formatPrice(price: price)
    }

    var originalPriceFormatted: String? {
      guard let originalPrice = originalPrice else {
        return nil
      }
      return formatPrice(price: originalPrice)
    }

    var imageURL: URL? {
      URL(string: thumbnail)
    }

    private func formatPrice(price: Double) -> String {
      let formatter = NumberFormatter()
      formatter.groupingSeparator = "."
      formatter.numberStyle = .decimal
      let priceFormatted = formatter.string(for: price)!
      return "$" + priceFormatted
    }
  }
}

#if DEBUG
struct ProductListRow_Previews: PreviewProvider {
  static let product = ProductListRow.ProductRow(
    id: "",
    title: "Apple iPhone 11 (64 GB) - Negro - Distribuidor autorizado",
    thumbnail: "http://http2.mlstatic.com/D_962169-MLA46153276294_052021-I.jpg",
    price: 389_990,
    originalPrice: 669_990
  )

  static var previews: some View {
    ProductListRow(productRow: product)
  }
}
#endif
