//
//  DrinkDetailView.swift
//  Shake-It
//
//  Created by 蔡欣妤 on 2024/6/17.
//

import SwiftUI

struct DrinkDetailView: View {
    var drinkType: String

    var body: some View {
        VStack {
            Text("Drink Detail")
              .font(.system(.title2, design: .rounded, weight: .bold))
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))

            VStack {
                Image(drinkType)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                    .padding(0)
                
                Text("\(drinkType)")
                    .font(.system(.title, design: .rounded, weight: .bold))
                HStack {
                    Text("This drink is full with")
                        .font(.system(.title3, design: .rounded, weight: .bold))
                    Text("happy")
                        .font(.system(.title3, design: .rounded, weight: .bold))
                        .foregroundColor(.yellow)
                            }
                Spacer()
            }
        }
    }
}

#Preview {
    DrinkDetailView(drinkType: "pearl milk tea")
}

