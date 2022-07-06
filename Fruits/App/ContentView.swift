//
//  ContentView.swift
//  Fruits
//
//  Created by Todd James on 7/3/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES

  @State private var isShowingSettings: Bool = false

  var fruits: [Fruit] = fruitsData

  var body: some View {
    NavigationView {
      List {
        ForEach(fruits.shuffled()) { item in
          NavigationLink(destination: FruitDetailView(fruit: item)) {
            FruitRowView(fruit: item)
              .padding(.vertical, 4)
          }}
      }
      .navigationTitle("Fruits") // on the list
      .navigationBarItems(
        trailing:
          Button(action: {
            isShowingSettings = true
          }, label: {
            Image(systemName: "slider.horizontal.3")
          })
          .sheet(isPresented: $isShowingSettings) {
            SettingsView()
          }
      )
    }
    .navigationViewStyle(.stack) // wasn't in course, googled. error in console
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(fruits: fruitsData)
      .preferredColorScheme(.dark)
  }
}
