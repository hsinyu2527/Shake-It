//
//  ContentView.swift
//  Shake-It
//
//  Created by Rui on 2024/6/12.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      TabView {
        Text("Calendar")
          .tabItem {
            Image(systemName: "calendar")
          }
        
        Text("Make a Drink")
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
          Text("Shake-It!")
            .font(.system(.title, design: .rounded, weight: .bold).lowercaseSmallCaps())
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
