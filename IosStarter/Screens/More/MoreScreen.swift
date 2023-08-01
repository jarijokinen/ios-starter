import SwiftUI

struct MoreScreen: View {
  var body: some View {
    let appVersion =
      Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    NavigationStack {
      VStack {
        List {
          NavigationLink {
            AccountView()
          } label: {
            HStack {
              Image(systemName: "person.fill")
              Text("Account")
            }
          }
          HStack {
            Image(systemName: "gearshape.fill")
            Text("Settings")
          }
          Text("Application version " + (appVersion ?? ""))
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .environment(\.defaultMinListRowHeight, 60)
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("More")
            .accessibilityAddTraits(.isHeader)
        }
      }
    }
  }
}
