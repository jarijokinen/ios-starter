import Foundation
import SwiftUI

@Observable final class AccountViewModel {
  var email: String = ""
  var password: String = ""
  var error: String? = nil
  
  func signIn() {
    Task {
      do {
        try await AuthManager.shared.signIn(email: email, password: password)
      } catch {
        self.error = error.localizedDescription
      }
    }
  }
  
  func signUp() {
    Task {
      do {
        try await AuthManager.shared.signUp(email: email, password: password)
      } catch {
        self.error = error.localizedDescription
      }
    }
  }
  
  func signOut() {
    do {
      try AuthManager.shared.signOut()
    } catch {
      self.error = error.localizedDescription
    }
  }
}
