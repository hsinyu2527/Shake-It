//
//  SettingsView.swift
//  Shake-It
//
//  Created by Rui on 2024/6/14.
//

import SwiftUI

struct SettingsView: View {
  let moods: Moods
  
  @State private var firstDayOfWeek = AppInfo.firstDayOfWeek
  @State private var displayMode = AppInfo.displayMode
  @State private var appLanguage = AppInfo.appLanguage
  
  var body: some View {
    Form {
      Section("一般") {
        Picker("一週的第一天", selection: $firstDayOfWeek) {
          ForEach(DayOfWeek.allCases, id: \.self) {
            Text($0.rawValue)
          }
        }
        .onChange(of: firstDayOfWeek) { AppInfo.firstDayOfWeek = firstDayOfWeek }
        
        Picker("顯示模式", selection: $displayMode) {
          ForEach(DisplayMode.allCases, id: \.self) {
            Text($0.rawValue)
          }
        }
        .onChange(of: displayMode) { AppInfo.displayMode = displayMode }
        
        Picker("語言", selection: $appLanguage) {
          ForEach(SupportedLanguage.allCases, id: \.self) {
            Text($0.rawValue)
          }
        }
        .onChange(of: appLanguage) { AppInfo.appLanguage = appLanguage }
      }
      
      Section("心情") {
        NavigationLink("編輯") {
          List {
            ForEach(moods.items) {
              Label($0.name, systemImage: "circlebadge.fill")
                .listItemTint($0.color)
            }
            .onDelete { moods.items.remove(atOffsets: $0) }
            .onMove { moods.items.move(fromOffsets: $0, toOffset: $1) }
          }
          .navigationTitle("心情")
          .toolbar { EditButton() }
        }
      }
      
      Section("更多資訊") {
        NavigationLink("使用說明") {
          Text("")
            .navigationTitle("使用說明")
        }
        
        NavigationLink("服務條款") {
          Text("")
            .navigationTitle("服務條款")
        }
        
        NavigationLink("關於") {
          VStack(alignment: .leading) {
            Text("Credit:").font(.headline)
            Text("Cup icon created by PLANBSTUDIO - Flaticon")
            
            Spacer()
          }
          .containerRelativeFrame(.horizontal) { width, _ in
            width * 0.9
          }
          .navigationTitle("關於")
        }
      }
    }
    .navigationTitle("Settings")
  }
}

#Preview {
  @State var moods = Moods()
  
  return SettingsView(moods: moods)
}
