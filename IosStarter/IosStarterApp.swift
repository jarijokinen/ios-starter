import SwiftUI
import FirebaseCore

@main
struct IosStarterApp: App {
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      MainScreen()
    }
  }
}
