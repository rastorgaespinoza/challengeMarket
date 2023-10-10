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

    let attributes = productRemote.attributes?.compactMap({
      attributeRemote in
      return ProductAttribute(
        id: attributeRemote.id,
        name: attributeRemote.name,
        valueName: attributeRemote.valueName,
        attributeGroupID: attributeRemote.attributeGroupID,
        attributeGroupName: attributeRemote.attributeGroupName
      )
    }) ?? []

    return Product(
      id: productRemote.id ?? "",
      title: productRemote.title ?? "",
      price: productRemote.price,
      originalPrice: productRemote.originalPrice,
      thumbnail: productRemote.thumbnail ?? "",
      installments: nil,
      shipping: shipping,
      seller: nil,
      officialStoreName: nil,
      attributes: attributes,
      pictures: (productRemote.pictures ?? []).compactMap({ $0.secureURL }),
      condition: productRemote.condition ?? ""
    )
  }
}
