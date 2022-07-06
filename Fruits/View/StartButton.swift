//
//  StartButton.swift
//  Fruits
//
//  Created by Todd James on 7/3/22.
//

import SwiftUI

struct StartButton: View {
  // MARK: PROPERTIES
  @AppStorage("isOnboarding") var isOnboarding: Bool?
  // MARK: BODY
  var body: some View {
    Button(action: {
      isOnboarding = false
    }, label: {
      HStack(spacing: 8) {
        Text("Start")
        Image(systemName: "arrow.right.circle")
          .imageScale(.large)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      .background(
        Capsule()
          .strokeBorder(.white, lineWidth: 1.25)
      )
    }) //: BUTTON
    .accentColor(.white)
  }
}

struct StartButton_Previews: PreviewProvider {
  static var previews: some View {
    StartButton()
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
  }
}
