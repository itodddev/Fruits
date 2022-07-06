//
//  FruitRowView.swift
//  Fruits
//
//  Created by Todd James on 7/4/22.
//

import SwiftUI

struct FruitRowView: View {
  // MARK: - PROPERTIES
  var fruit: Fruit

  // MARK: - BODY

  var body: some View {
    HStack {
      Image(fruit.image)
        .renderingMode(.original) // prevent image from being colorized by the system link color, when row is added to List
        .resizable()
        .scaledToFit()
        .frame(width: 80, height: 80, alignment: .center)
        .shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2)
        .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(8)

      VStack(alignment: .leading, spacing: 5) {
        Text(fruit.title)
          .font(.title2)
          .fontWeight(.bold)
        Text(fruit.headline)
          .font(.caption)
          .foregroundColor(Color.secondary)
      }
    } //: HSTACK
  }
}

struct FruitRowView_Previews: PreviewProvider {
  static var previews: some View {
    FruitRowView(fruit: fruitsData[0])
    .previewLayout(.sizeThatFits)
    .padding()
  }
}
