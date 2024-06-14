//
//  MoodButton.swift
//  Shake-It
//
//  Created by Rui on 2024/6/13.
//

import SwiftUI

struct MoodButton: View {
  let mood: MoodItem
  
  @Binding var addedMoods: [MoodItem]
  
  var body: some View {
    Button {
      addedMoods.append(mood)
    } label: {
      Text(mood.name)
        .padding(.vertical, 12)
        .frame(width: 110)
        .foregroundStyle(mood.color)
        .font(.title2.bold())
        .overlay {
          RoundedRectangle(cornerRadius: 8)
            .strokeBorder(mood.color, lineWidth: 2)
        }
    }
  }
}

#Preview {
  @State var moods = Moods()
  @State var addedMoods = [MoodItem]()
  
  return MoodButton(mood: moods.items[0], addedMoods: $addedMoods)
}
