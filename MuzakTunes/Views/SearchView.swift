import SwiftUI
import SDWebImageSwiftUI

struct SearchView: View {
    @StateObject private var viewModel: TrackViewModel
    @State private var searchText = ""
    
    init(jamendoService: JamendoService) {
        _viewModel = StateObject(wrappedValue: TrackViewModel(jamendoService: jamendoService))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onSearch: {
                    viewModel.searchTracks(query: searchText)
                })
                
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    List(viewModel.tracks) { track in
                        TrackRow(track: track)
                    }
                }
            }
            .navigationTitle("MuzakTunes")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    let onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search tracks...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit(onSearch)
            
            Button(action: onSearch) {
                Image(systemName: "magnifyingglass")
            }
        }
        .padding()
    }
}

struct TrackRow: View {
    let track: Track
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: track.imageURL))
                .resizable()
                .placeholder {
                    Color.gray
                }
                .scaledToFit()
                .frame(width: 50, height: 50)
                .cornerRadius(4)
            
            VStack(alignment: .leading) {
                Text(track.name)
                    .font(.headline)
                Text(track.artistName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
} 