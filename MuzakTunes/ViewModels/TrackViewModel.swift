import Foundation
import SwiftUI

@MainActor
class TrackViewModel: ObservableObject {
    @Published var tracks: [Track] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let jamendoService: JamendoService
    
    init(jamendoService: JamendoService) {
        self.jamendoService = jamendoService
    }
    
    func searchTracks(query: String) {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                tracks = try await jamendoService.searchTracks(query: query)
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
} 