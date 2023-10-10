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
      image

      VStack(alignment: .leading, spacing: 8) {
        title

        prices

        installments

        shipping

        officialStoreName

        condition

        international
      }

      Spacer(minLength: .zero)
    }
  }
}

extension ProductListRow {
  private var image: some View {
    AsyncImage(url: product.imageURL) { phase in
      if let image = phase.image {
        image
          .resizable()
          .scaledToFit()

      } else if phase.error != nil {
        Color(uiColor: UIColor.secondarySystemBackground)

      } else {
        Color(uiColor: UIColor.secondarySystemBackground)
      }
    }
    .frame(width: 140, height: 140)
    .background(Color(uiColor: UIColor.secondarySystemBackground))
    .cornerRadius(8)
  }

  private var title: some View {
    Text(product.title)
      .customFont(.regularSoft, size: 14)
      .foregroundColor(.neutral200)
      .lineLimit(3)
      .multilineTextAlignment(.leading)
  }

  private var prices: some View {
    VStack(alignment: .leading, spacing: 4) {
      if let originalPrice = product.originalPriceFormatted {
        Text(originalPrice)
          .strikethrough()
          .customFont(.light, size: 11)
          .foregroundColor(.neutral300)
      }

      HStack(spacing: 8) {
        Text(product.priceFormatted)
          .customFont(.mediumSoft, size: 20)
          .foregroundColor(.neutral100)

        if let discount = product.discount {
          Text("\(discount)% OFF")
            .customFont(.light, size: 12)
            .foregroundColor(.success100)
        }
      }
    }
  }

  @ViewBuilder private var installments: some View {
    if let installments = product.installmentLabel {
      Text(installmentsAttributed(installments))
    }
  }

  private func installmentsAttributed(_ installmentLabel: String) -> AttributedString {
    var start = AttributedString("en ")
    start.font = .custom(ProximaNovaFont.regularSoft.rawValue, size: 12)
    start.foregroundColor = .neutral200

    var installment = AttributedString("\(installmentLabel)")
    installment.font = .custom(ProximaNovaFont.regularSoft.rawValue, size: 12)
    installment.foregroundColor = .success100

    return start + installment
  }

  @ViewBuilder private var shipping: some View {
    if product.freeShipping {
      Text("Envío gratis")
        .customFont(.semibold, size: 12)
        .foregroundColor(.success100)
    }
  }

  @ViewBuilder private var officialStoreName: some View {
    if let officialStoreName = product.officialStoreName {
      Text("por \(officialStoreName)")
        .customFont(.regular, size: 12)
        .foregroundColor(.neutral400)
    }
  }

  @ViewBuilder private var condition: some View {
    if product.isUsed {
      Text("Usado")
        .customFont(.light, size: 12)
        .foregroundColor(.neutral400)
    }
  }

  @ViewBuilder private var international: some View {
    if product.isInternational {
      Text("COMPRA INTERNACIONAL")
        .customFont(.regularItalic, size: 12)
        .italic()
        .foregroundColor(.link100)
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
    let installments: Installments?
    let freeShipping: Bool
    let officialStoreName: String?
    let isUsed: Bool
    let isInternational: Bool

    var imageURL: URL? {
      URL(string: thumbnail)
    }

    var priceFormatted: String {
      formatPrice(price: price)
    }

    var originalPriceFormatted: String? {
      guard let originalPrice = originalPrice else {
        return nil
      }
      return formatPrice(price: originalPrice)
    }

    var discount: Int? {
      guard  let originalPrice = originalPrice, price < originalPrice else { return nil }

      let discount = getDiscount(offerPrice: price, originalPrice: originalPrice)
      return discount
    }

    private func getDiscount(offerPrice: Double, originalPrice: Double) -> Int {
      let divived = offerPrice / originalPrice
      if divived == 1.0 {
        return 0
      }

      let discount: Double = (divived * 100.0)
      let roundedDiscount = Int(round(discount)) - 100
      return abs(roundedDiscount)
    }

    var installmentLabel: String? {
      guard let installments = installments, installments.quantity > 1 else { return nil }

      return "\(installments.quantity)x \(formatPrice(price: round(installments.amount))) sin interés"
    }

    private func formatPrice(price: Double) -> String {
      let formatter = NumberFormatter()
      formatter.groupingSeparator = "."
      formatter.numberStyle = .decimal
      let priceFormatted = formatter.string(for: price)!
      return "$ " + priceFormatted
    }
  }
}

#if DEBUG
struct ProductListRow_Previews: PreviewProvider {
  static var previews: some View {
    ProductListRow(productRow: .preview)
  }
}
#endif
