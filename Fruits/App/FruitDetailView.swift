//
//  FruitDetailView.swift
//  Fruits
//
//  Created by Todd James on 7/4/22.
//

import SwiftUI

struct FruitDetailView: View {

  var fruit: Fruit

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
          // HEADER
          FruitHeaderView(fruit: fruit)

          VStack(alignment: .leading, spacing: 20) {
            // TITLE
            Text(fruit.title)
              .font(.largeTitle)
              .fontWeight(.heavy)
              .foregroundColor(fruit.gradientColors[1])

            // HEADLINE
            Text(fruit.headline)
              .font(.headline)
              .multilineTextAlignment(.leading)

            // NUTRIENTS
            FruitNutrientsView(fruit: fruit)

            // SUBHEADLINE
            Text("Learn more about \(fruit.title)".uppercased())
              .fontWeight(.bold)
              .foregroundColor(fruit.gradientColors[1])

            // DESCRIPTION
            Text(fruit.description)
              .multilineTextAlignment(.leading)

            // LINK
            SourceLinkView()
              .padding(.top, 10)
              .padding(.bottom, 40)
          }
          .padding(.horizontal, 20)
          .frame(maxWidth: 640, alignment: .center) // mainly for iPad landscape, text area is only 640 wide and centered
        }
        .navigationBarTitle(fruit.title, displayMode: .inline) // 1. in limiting space on top of header
        .navigationBarHidden(true) // 2.
      }
      .edgesIgnoringSafeArea(.all) // 3. Scrollview edges inore safe areas, was .top, changed to all to get safe areas on sides in landscape
    }
    .navigationViewStyle(StackNavigationViewStyle()) // makes view take up all landscape view
  }
}

struct FruitDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FruitDetailView(fruit: fruitsData[0])
  }
}
