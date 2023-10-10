//
//  SearchProductsRemoteMapper.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import Foundation

extension Array where Element == ProductRemoteDTO {
  func toModels() -> [Product] {
    return map {
      var installments: Installments?
      if let installmentsRemote = $0.installments {
        installments = Installments(
          quantity: installmentsRemote.quantity ?? 0,
          amount: installmentsRemote.amount ?? 0,
          rate: installmentsRemote.rate ?? 0,
          currencyID: installmentsRemote.currencyID ?? ""
        )
      }

      var shipping: Shipping?
      if let shippingRemote = $0.shipping {
        shipping = Shipping(
          storePickUp: shippingRemote.storePickUp,
          freeShipping: shippingRemote.freeShipping,
          logisticType: shippingRemote.logisticType,
          mode: shippingRemote.mode,
          tags: shippingRemote.tags
        )
      }

      var seller: Seller?
      if let sellerRemote = $0.seller {
        seller = Seller(
          id: sellerRemote.id,
          nickname: sellerRemote.nickname,
          carDealer: sellerRemote.carDealer,
          realEstateAgency: sellerRemote.realEstateAgency,
          registrationDate: sellerRemote.registrationDate,
          tags: sellerRemote.tags,
          carDealerLogo: sellerRemote.carDealerLogo
        )
      }

      return Product(
        id: $0.id ?? "",
        title: $0.title ?? "",
        price: $0.price,
        originalPrice: $0.originalPrice,
        thumbnail: $0.thumbnail ?? "",
        installments: installments,
        shipping: shipping,
        seller: seller,
        officialStoreName: $0.officialStoreName,
        attributes: [],
        pictures: [],
        condition: $0.condition ?? ""
      )
    }
  }
}
