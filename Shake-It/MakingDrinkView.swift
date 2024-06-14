//
//  MakingDrinkView.swift
//  Shake-It
//
//  Created by Rui on 2024/6/13.
//

import SwiftUI

struct MakingDrinkView: View {
  let moods: Moods
  
  @Binding var addedMoods: [MoodItem]
  
  var body: some View {
    VStack {
      Text("Let's Make a Drink!")
        .font(.system(.title2, design: .rounded, weight: .bold))
      
      Spacer()
      
      HStack {
        Spacer()
        NavigationLink {
          Text("Drinks Collection Book")
        } label: {
          Image(systemName: "book.pages")
            .foregroundStyle(.brown)
            .font(.system(.title, weight: .medium))
        }
      }
      .containerRelativeFrame(.horizontal) { width, _ in
        width * 0.9
      }
      
      VStack(spacing: 20) {
        Image(.cup)
          .resizable()
          .renderingMode(.template)
          .foregroundStyle(.gray)
          .scaledToFit()
          .frame(height: 350)
          .padding(.vertical, -35)
        
        Text("已投入 \(addedMoods.count) 份心情")
        
        ScrollView {
          LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
            ForEach(moods.items) {
              MoodButton(mood: $0, addedMoods: $addedMoods)
            }
          }
          .padding(.horizontal)
        }
        
        HStack(spacing: 30) {
          Button("倒掉重來") {
            addedMoods.removeAll()
          }
          .padding()
          .foregroundStyle(.white)
          .background(.gray)
          .clipShape(.buttonBorder)
          
          Button("搖一搖！") {
            
          }
          .padding()
          .foregroundStyle(.white)
          .background(.appColor)
          .clipShape(.buttonBorder)
        }
      }
      
      Spacer()
      Spacer()
    }
  }
}

#Preview {
  @State var moods = Moods()
  @State var addedMoods = [MoodItem]()
  
  return MakingDrinkView(moods: moods, addedMoods: $addedMoods)
}
