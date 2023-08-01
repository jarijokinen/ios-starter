import SwiftUI

struct AccountView: View {
  @State private var vm = AccountViewModel()
  
  var body: some View {
    if AuthManager.shared.authState == .signedOut {
      SignInView()
    }
    else {
      Text("You are signed in")
      Button("Sign out", action: { vm.signOut() })
    }
  }
}
