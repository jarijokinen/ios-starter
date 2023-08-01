import Foundation

struct Post: Identifiable, Decodable {
  let id: Int
  let title: String
  let body: String
}
