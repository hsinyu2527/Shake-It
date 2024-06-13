//
//  ContentView.swift
//  Shake-It
//
//  Created by Rui on 2024/6/12.
//

import SwiftUI

struct ContentView: View {
  let moodTypes: [MoodType] = Bundle.main.decode(form: "moodTypes.json")
  let moods: [Mood] = Bundle.main.decode(form: "moods.json")
  let colors: [CustomColor] = Bundle.main.decode(form: "appColors.json")
  
  @State private var addedMoods = [Mood]()
  
  var body: some View {
    NavigationStack {
      TabView {
        Text("Calendar")
          .tabItem {
            Image(systemName: "calendar")
          }
        
        MakingDrinkView(moods: moods, addedMoods: $addedMoods)
          .tabItem {
            Image(systemName: "wineglass")
          }
        
        Text("Statistics")
          .tabItem {
            Image(systemName: "chart.xyaxis.line")
          }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .principal) {
          appInfo.formattedName
        }
        
        ToolbarItem {
          NavigationLink {
            Text("Settings")
          } label: {
            Image(systemName: "gearshape")
          }
        }
      }
    }
    .tint(.appColor)
//    .onAppear {
//      UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
//      UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
//    }
  }
}

#Preview {
  ContentView()
}
