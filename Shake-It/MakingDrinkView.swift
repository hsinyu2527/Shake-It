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
  @State private var isShaking = false
  @State private var isPouring = false
  @State private var navigateToDetail = false
  
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
            isPouring = true
          }
          .padding()
          .foregroundStyle(.white)
          .background(.gray)
          .clipShape(.buttonBorder)
          
          Button("搖一搖！") {
            isShaking = true
          }
          .padding()
          .foregroundStyle(.white)
          .background(.appColor)
          .clipShape(.buttonBorder)
        }
        .alert("要搖一搖了嗎？", isPresented: $isShaking) {
          Button("再想想") {
            
          }
          
          Button("搖！！") {
            addedMoods.removeAll()
            navigateToDetail = true
          }
        } message: {
          Text("每天都只能搖一杯心情，\n一旦確認就不可以再更改囉～")
        }
        .alert("要倒掉重來嗎？", isPresented: $isPouring) {
          Button("再想想") {
            
          }
          
          Button("倒掉！") {
            addedMoods.removeAll()
          }
        } message: {
          Text("已經投入的心情會全部消失喔～")
        }
      }
      
      Spacer()
      Spacer()
    }
    .navigationDestination(isPresented: $navigateToDetail) {
        DrinkDetailView(drinkType: "pearl milk tea")
    }
  }
}

#Preview {
  @State var moods = Moods()
  @State var addedMoods = [MoodItem]()
  
  return MakingDrinkView(moods: moods, addedMoods: $addedMoods)
}
