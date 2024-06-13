//
//  MoodButton.swift
//  Shake-It
//
//  Created by Rui on 2024/6/13.
//

import SwiftUI

struct MoodButton: View {
  let mood: Mood
  
  var body: some View {
    Button {
      
    } label: {
      Text(mood.name)
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .foregroundStyle(mood.color)
        .font(.title2.bold())
        .overlay {
          RoundedRectangle(cornerRadius: 8)
            .stroke(mood.color, lineWidth: 2)
        }
    }
  }
}

#Preview {
  let moods: [Mood] = Bundle.main.decode(form: "moods.json")
  
  return MoodButton(mood: moods[0])
}
