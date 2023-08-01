import Foundation
import FirebaseAuth
import SwiftUI

@Observable final class AuthManager {
  static let shared = AuthManager()
  
  private var authListener: AuthStateDidChangeListenerHandle?
  private(set) var authState: AuthState = .undefined
  
  init() {
    if authListener == nil {
      authListener = Auth.auth().addStateDidChangeListener { auth, user in
        self.authState = user == nil ? .signedOut : .signedIn
      }
    }
  }
  
  deinit {
    if let authListener = authListener {
      Auth.auth().removeStateDidChangeListener(authListener)
      self.authListener = nil
    }
  }
  
  func signUp(email: String, password: String) async throws {
    do {
      try await Auth.auth().createUser(withEmail: email, password: password)
      self.authState = .signedIn
    } catch {
      throw error
    }
  }
  
  func signIn(email: String, password: String) async throws {
    do {
      try await Auth.auth().signIn(withEmail: email, password: password)
      self.authState = .signedIn
    } catch {
      throw error
    }
  }
  
  func signOut() throws {
    do {
      try Auth.auth().signOut()
      self.authState = .signedOut
    } catch {
      throw error
    }
  }
  
  func currentUser() -> User? {
    return Auth.auth().currentUser
  }
  
  enum AuthState {
    case undefined, signedIn, signedOut
  }
}
