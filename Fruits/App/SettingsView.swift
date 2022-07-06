//
//  SettingsView.swift
//  Fruits
//
//  Created by Todd James on 7/6/22.
//

import SwiftUI

struct SettingsView: View {

  @Environment(\.presentationMode) var presentationMode // come from the eviroment of the device, like darkmode, etc

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20) {
          // MARK: - SECTION 1
          GroupBox(
            label:
              SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
          ) {
            Divider().padding(.vertical, 4)
            HStack(alignment: .center, spacing: 10) {
              Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(9)
              Text("Most fruits are naturally low in fat, sodium, and calories.  None have cholesterol.  Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                .font(.footnote)
            }
          }

          // MARK: - SECTION 2

          // MARK: - SECTION 3
        }
        .navigationBarTitle(Text("Settings"), displayMode: .large)
        .navigationBarItems(
          trailing:
            Button(action: {
              presentationMode.wrappedValue.dismiss()
            }, label: {
              Image(systemName: "xmark")
            }))
        .padding()

      }
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
      SettingsView()
        .previewDevice("iPhone 12 Pro Max")
        .preferredColorScheme(.dark)
    }
}
