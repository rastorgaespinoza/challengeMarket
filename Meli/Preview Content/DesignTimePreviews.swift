//
//  DesignTimePreviews.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 09-10-23.
//

extension ProductListRow.ProductRow {
  static let preview = ProductListRow.ProductRow(
    id: "",
    title: "Apple iPhone 11 (64 GB) - Negro - Distribuidor autorizado",
    thumbnail: "http://http2.mlstatic.com/D_962169-MLA46153276294_052021-I.jpg",
    price: 389_990,
    originalPrice: 669_990,
    installments: Installments(quantity: 12, amount: 32499.17, rate: 0, currencyID: "CLP"),
    freeShipping: true,
    officialStoreName: "Apple",
    isUsed: false,
    isInternational: false
  )
}

extension ProductDetailPageView.ProductDetail {
  static let preview = ProductDetailPageView.ProductDetail(
    id: "",
    title: "Apple iPhone 11 (64 GB) - Negro - Distribuidor autorizado",
    thumbnail: "http://http2.mlstatic.com/D_962169-MLA46153276294_052021-I.jpg",
    price: 389_990,
    originalPrice: 669_990,
    installments: Installments(quantity: 12, amount: 32499.17, rate: 0, currencyID: "CLP"),
    freeShipping: true,
    attributes: []
  )
}

extension ProductDetailFeaturesView.Source {
  static let previews: [ProductDetailFeaturesView.Source] = [
    ProductDetailFeaturesView.Source(displayName: "Información adicional requerida", value: "Tiene IMEI,Tiene número de serie"),
    ProductDetailFeaturesView.Source(displayName: "Características de las baterías", value: "De litio instaladas"),
    ProductDetailFeaturesView.Source(displayName: "Capacidad de la batería", value: "3110 mAh"),
    ProductDetailFeaturesView.Source(displayName: "Tipo de batería", value: "Ion de litio")
  ]
}
