//
//  ProductDetailPageView.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 07-10-23.
//

import SwiftUI

struct ProductDetailPageView: View {
  let productDetail: ProductDetail
  @StateObject private var productDetailViewModel = ProductDetailServiceLocator().productDetailViewModel

  init(productDetail: ProductDetail) {
    self.productDetail = productDetail
  }

  var body: some View {
    LazyVStack(alignment: .leading, spacing: 8) {
      Text(productDetail.title)

      image

      prices

      seeAllFeatures
//      switch productDetailViewModel.state {
//      case .neverLoading:
//        Text("neverLoading")
//      case .loading:
//        ProgressView()
//          .frame(maxWidth: .infinity)
//      case .success(let product):
//        Text("success")
//      case .error:
//        Text("error")
//      }

      Spacer()
    }
    .padding()
    .onAppear {
      productDetailViewModel.getProductDetail(itemId: productDetail.id)
    }
  }
}

extension ProductDetailPageView {
  private var image: some View {
    AsyncImage(url: productDetail.imageURL) { phase in
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

  private var prices: some View {
    VStack(alignment: .leading, spacing: 4) {
      if let originalPrice = productDetail.originalPriceFormatted {
        Text(originalPrice)
          .strikethrough()
          .customFont(.light, size: 16)
          .foregroundColor(.neutral300)
      }

      HStack(spacing: 8) {
        Text(productDetail.priceFormatted)
          .customFont(.mediumSoft, size: 32)
          .foregroundColor(.neutral100)

        if let discount = productDetail.discount {
          Text("\(discount)% OFF")
            .customFont(.light, size: 16)
            .foregroundColor(.success100)
        }
      }
    }
  }

  private var seeAllFeatures: some View {
    NavigationLink(value: Route.productFeatures(productDetail.attributes)) {
      HStack {
        Text("Ver todas las características")
        Spacer()
        Image(systemName: "chevron.forward")
      }
      .padding()
      .overlay(
        RoundedRectangle(cornerRadius: 8)
      )
    }
  }
}

extension ProductDetailPageView {
  struct ProductDetail: Identifiable {
    let id: String
    let title: String
    let thumbnail: String
    let price: Double
    let originalPrice: Double?
    let installments: Installments?
    let freeShipping: Bool
    let attributes: [ProductAttribute]

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
struct ProductDetailPageView_Previews: PreviewProvider {
  static let productDetail = ProductDetailPageView.ProductDetail(
    id: "",
    title: "Apple iPhone 11 (64 GB) - Negro - Distribuidor autorizado",
    thumbnail: "http://http2.mlstatic.com/D_962169-MLA46153276294_052021-I.jpg",
    price: 389_990,
    originalPrice: 669_990,
    installments: Installments(quantity: 12, amount: 32499.17, rate: 0, currencyID: "CLP"),
    freeShipping: true,
    attributes: []
  )

  static var previews: some View {
    ProductDetailPageView(productDetail: productDetail)
  }
}
#endif
