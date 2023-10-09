//
//  Font+extension.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 08-10-23.
//

import SwiftUI

extension View {
  func customFont(_ font: ProximaNovaFont, size: CGFloat) -> some View {
    self.font(.custom(font.rawValue, size: size, relativeTo: .body))
  }
}
