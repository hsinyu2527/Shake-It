//
//  MoodButton.swift
//  Shake-It
//
//  Created by Rui on 2024/6/13.
//

import SwiftUI

struct MoodButton: View {
  let mood: Mood
  
  @Binding var addedMoods: [Mood]
  
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
  let moods: [Mood] = Bundle.main.decode(form: "moods.json")
  @State var addedMoods = [Mood]()
  
  return MoodButton(mood: moods[0], addedMoods: $addedMoods)
}
