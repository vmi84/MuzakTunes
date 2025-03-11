import Foundation

struct Track: Identifiable, Codable {
    let id: String
    let name: String
    let artistName: String
    let albumName: String
    let duration: Int
    let imageURL: String
    let audioURL: String
    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case artistName = "artist_name"
        case albumName = "album_name"
        case duration
        case imageURL = "image_url"
        case audioURL = "audio_url"
        case tags
    }
} 