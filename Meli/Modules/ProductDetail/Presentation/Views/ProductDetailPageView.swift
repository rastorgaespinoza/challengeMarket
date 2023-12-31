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
  @State private var product: Product?
  @State private var description: String?
  @State private var currentImage: String = ""

  init(productDetail: ProductDetail) {
    self.productDetail = productDetail
  }

  var body: some View {
    ScrollView {
      LazyVStack(alignment: .leading, spacing: 16) {
        Text(productDetail.title)

        imageContainer

        prices

        installments

        detailFeatures

        Divider()

        descriptionProduct

        Spacer()
      }
      .padding()
      .onChange(of: productDetailViewModel.state, perform: { value in
        if case let .success(product) = value {
          self.product = product
        }
      })
    }
  }
}

extension ProductDetailPageView {
  @ViewBuilder private var imageContainer: some View {
    if let pictures = product?.pictures, !pictures.isEmpty {
      TabView(selection: $currentImage) {
        ForEach(pictures, id: \.self) { picture in
          AsyncImage(url: URL(string: picture)) { phase in
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
          .frame(maxWidth: .infinity)
          .tag(picture)

        }
      }
      .tabViewStyle(.page(indexDisplayMode: .always))
      .indexViewStyle(.page(backgroundDisplayMode: .always))
      .aspectRatio(0.9, contentMode: .fit)
    } else {
      image
    }
  }

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
    .frame(maxWidth: .infinity)
    .aspectRatio(0.9, contentMode: .fit)
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

  @ViewBuilder private var detailFeatures: some View {
    switch productDetailViewModel.state {
    case .neverLoading:
      Text("")
        .onAppear {
          productDetailViewModel.getProductDetail(itemId: productDetail.id)
        }
    case .loading:
      ProgressView()
        .frame(maxWidth: .infinity)
    case let .success(product):
      seeAllFeatures(product)

    case .error:
      EmptyView()
    }
  }

  @ViewBuilder private var installments: some View {
    if let installments = productDetail.installmentLabel {
      Text(installmentsAttributed(installments))
    }
  }

  private func installmentsAttributed(_ installmentLabel: String) -> AttributedString {
    var start = AttributedString("en ")
    start.font = .custom(ProximaNovaFont.regularSoft.rawValue, size: 16)
    start.foregroundColor = .neutral200

    var installment = AttributedString("\(installmentLabel)")
    installment.font = .custom(ProximaNovaFont.regularSoft.rawValue, size: 16)
    installment.foregroundColor = .success100

    return start + installment
  }

  private func seeAllFeatures(_ product: Product) -> some View {
    NavigationLink(value: Route.productFeatures(product.attributes)) {
      HStack {
        Text("Ver todas las características")
          .customFont(.regular, size: 14)
          .foregroundColor(.blue)
        Spacer()
        Image(systemName: "chevron.forward")
      }
      .padding()
      .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.neutral400, lineWidth: 1))
    }
  }

  @ViewBuilder private var descriptionProduct: some View {
    switch productDetailViewModel.stateDescription {
    case .neverLoading:
      Text("")
        .onAppear {
          productDetailViewModel.getProductDescription(itemId: productDetail.id)
        }
    case .loading, .error:
      EmptyView()

    case let .success(description):
      descriptionLabel(description)
    }
  }

  private func descriptionLabel(_ description: String) -> some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Descripción")
        .customFont(.regular, size: 24)

      Text(description)
        .customFont(.regular, size: 16)
        .multilineTextAlignment(.leading)
        .lineSpacing(5)
    }
    .foregroundColor(.neutral200)
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
  static var previews: some View {
    ProductDetailPageView(productDetail: .preview)
      .preferredColorScheme(.light)
      .previewDisplayName("Light Theme")

    ProductDetailPageView(productDetail: .preview)
      .preferredColorScheme(.dark)
      .previewDisplayName("Dark Theme")
  }
}
#endif
