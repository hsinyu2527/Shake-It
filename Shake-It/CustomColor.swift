//
//  CustomColor.swift
//  Shake-It
//
//  Created by Rui on 2024/6/13.
//

import SwiftUI

enum CustomColorType: String, Codable, Hashable {
  case red, orange, yellow, green, mint, teal, blue, indigo, gray
}

struct CustomColor: Codable, Hashable {
  let type: CustomColorType?
  let name: String?
  let (h, s, b): (Int, Int, Int)
  
  var hue: Double {
    Double(h) / 360
  }
  
  var saturation: Double {
    Double(s) / 100
  }
  
  var brightness: Double {
    Double(b) / 100
  }
  
  var color: Color {
    .init(hue: hue, saturation: saturation, brightness: brightness)
  }
}

extension CustomColor {
  init(h: Int, s: Int, b: Int) {
    self.type = nil
    self.name = nil
    self.h = h
    self.s = s
    self.b = b
  }
}

extension Color {
  static var systemColor: [String: Color] {
    [
      "black": .black,
      "blue": .blue,
      "brown": .brown,
      "cyan": .cyan,
      "gray": .gray,
      "green": .green,
      "indigo": .indigo,
      "mint": .mint,
      "orange": .orange,
      "pink": .pink,
      "purple": .purple,
      "red": .red,
      "teal": .teal,
      "white": .white,
      "yellow": .yellow
    ]
  }
}
