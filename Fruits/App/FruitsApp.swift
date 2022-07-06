//
//  FruitsApp.swift
//  Fruits
//
//  Created by Todd James on 7/3/22.
//

import SwiftUI

@main
struct FruitsApp: App {
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  
  var body: some Scene {
    WindowGroup {
      if isOnboarding {
        OnboardingView()
      } else {
        ContentView()
      }
    }
  }
}
