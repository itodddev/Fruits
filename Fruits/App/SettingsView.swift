//
//  SettingsView.swift
//  Fruits
//
//  Created by Todd James on 7/6/22.
//

import SwiftUI

struct SettingsView: View {

  @Environment(\.presentationMode) var presentationMode // come from the eviroment of the device, like darkmode, etc
  @AppStorage("isOnboarding") var isOnboarding: Bool = false

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
          GroupBox(
            label:
              SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
          ) {
            Divider().padding(.vertical, 4)
            Text("If you wish, you can restart the application by toggling the switch in this box.  That way it starts the onboarding process and you will see the welcome screen again.")
              .padding(.vertical, 8)
              .frame(minHeight: 60)
              .layoutPriority(1) // prevents long text from truncation
              .font(.body)
              .multilineTextAlignment(.leading)

            Toggle(isOn: $isOnboarding) {
              if isOnboarding {
                Text("Restarted".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(.green)
              } else {
                Text("Restart".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(.secondary)
              }
            }
            .padding()
            .background(
              Color(UIColor.tertiarySystemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            )

          }
          // MARK: - SECTION 3
          GroupBox(
            label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
          ) {
            SettingsRowView(name: "Developer", content: "iTodd")
            SettingsRowView(name: "Designer", content: "Todd James")
            SettingsRowView(name: "Compatibility", content: "iOS 15")
            SettingsRowView(name: "Website", linkLabel: "iTodd", linkDestination: "itodd.co")
            SettingsRowView(name: "Twitter", linkLabel: "@TJames501", linkDestination: "twitter.com/tjames501")
            SettingsRowView(name: "SwiftUI", content: "3.0")
            SettingsRowView(name: "Version", content: "1.0.1")
          }
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
