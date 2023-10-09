//
//  ProductDetailRemoteMapper.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

import Foundation

enum ProductDetailRemoteMapper {
  static func map(_ productRemote: ProductDetailRemoteDTO) -> Product {
    let shipping = Shipping(
      storePickUp: productRemote.shipping?.storePickUp,
      freeShipping: productRemote.shipping?.freeShipping,
      logisticType: productRemote.shipping?.logisticType,
      mode: productRemote.shipping?.mode,
      tags: productRemote.shipping?.tags
    )
    return Product(
      id: productRemote.id ?? "",
      title: productRemote.title ?? "",
      price: productRemote.price,
      originalPrice: productRemote.originalPrice,
      thumbnail: productRemote.thumbnail ?? "",
      installments: nil,
      shipping: shipping,
      officialStoreName: nil
    )
  }
}
