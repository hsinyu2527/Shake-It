//
//  appInfo.swift
//  Shake-It
//
//  Created by Rui on 2024/6/13.
//

import SwiftUI

enum appInfo {
  static let name = "Shake-It!"
  static var formattedName: some View {
    Text("Shake-It!")
      .font(.system(.title, design: .rounded, weight: .bold).lowercaseSmallCaps())
  }
}
