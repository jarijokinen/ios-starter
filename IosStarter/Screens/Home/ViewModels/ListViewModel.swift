import Foundation
import SwiftUI

@Observable final class ListViewModel {
  private(set) var items: [Post] = []
  private(set) var loading = false
  private(set) var error: String? = nil
  
  private let apiService = ApiService(baseUrl:
    "https://jsonplaceholder.typicode.com")
  
  func fetchItems() async {
    loading = true
    defer { loading = false }
    
    do {
      let data: [Post] = try await apiService.get("/posts")
      self.items = data
    } catch {
      self.error = error.localizedDescription
    }
  }
}
