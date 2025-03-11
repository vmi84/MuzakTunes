import Foundation

class JamendoService {
    private let baseURL = "https://api.jamendo.com/v3.0"
    private let clientId: String
    
    init(clientId: String) {
        self.clientId = clientId
    }
    
    func searchTracks(query: String) async throws -> [Track] {
        var components = URLComponents(string: "\(baseURL)/tracks/")!
        components.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "limit", value: "20"),
            URLQueryItem(name: "search", value: query)
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(JamendoResponse.self, from: data)
        return result.results
    }
}

struct JamendoResponse: Codable {
    let results: [Track]
} 