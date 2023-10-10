//
//  String+extension.swift
//  Meli
//
//  Created by Rodrigo Astorga Espinoza on 10-10-23.
//

import Foundation

extension String {
  var trimmed: String {
    self.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
