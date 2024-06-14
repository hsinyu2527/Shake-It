//
//  AppInfo.swift
//  Shake-It
//
//  Created by Rui on 2024/6/13.
//

import SwiftUI

enum DayOfWeek: String, CaseIterable {
  case Sunday = "星期日"
  case Monday = "星期一"
  case Tuesday = "星期二"
  case Wednesday = "星期三"
  case Thursday = "星期四"
  case Friday = "星期五"
  case Saturday = "星期六"
}

enum DisplayMode: String, CaseIterable {
  case System = "系統"
  case Light = "淺色"
  case Dark = "深色"
}

enum SupportedLanguage: String, CaseIterable {
  case zh_TW = "正體中文"
  case en_US = "英文"
}

enum AppInfo {
  static let name = "Shake-It!"
  static var formattedName: some View {
    Text("Shake-It!")
      .font(.system(.title, design: .rounded, weight: .bold).lowercaseSmallCaps())
  }
  
  static var firstDayOfWeek: DayOfWeek = .Monday
  static var displayMode: DisplayMode = .Light
  static var appLanguage: SupportedLanguage = .zh_TW
}
