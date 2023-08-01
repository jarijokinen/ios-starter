import SwiftUI

struct MainScreen: View {
  var body: some View {
    TabView {
      HomeScreen().tabItem {
        Image(systemName: "house.fill")
        Text("Home")
      }
      MoreScreen().tabItem {
        Image(systemName: "line.horizontal.3")
        Text("More")
      }
    }
  }
}
