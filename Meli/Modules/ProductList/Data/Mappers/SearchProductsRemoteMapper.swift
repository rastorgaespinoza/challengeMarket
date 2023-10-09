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

      return Product(
        id: $0.id ?? "",
        title: $0.title ?? "",
        price: $0.price,
        originalPrice: $0.originalPrice,
        thumbnail: $0.thumbnail ?? "",
        installments: installments
      )
    }
  }
}
