import Foundation

class ApiService {
  private let baseUrl: String
  
  init(baseUrl: String) {
    self.baseUrl = baseUrl
  }
  
  func get<T: Decodable>(_ endpoint: String) async throws -> T {
    guard let url = URL(string: baseUrl + endpoint) else {
      throw ApiServiceError.invalidUrl
    }
    
    guard let (data, res) = try? await URLSession.shared.data(from: url) else {
      throw ApiServiceError.requestError
    }
    
    guard let res = res as? HTTPURLResponse, res.statusCode == 200 else {
      throw ApiServiceError.invalidStatus
    }

    guard let json = try? JSONDecoder().decode(T.self, from: data) else {
      throw ApiServiceError.jsonDecodingError
    }
    
    return json
  }
}

enum ApiServiceError: Error {
  case invalidStatus, invalidUrl, jsonDecodingError, requestError
}
