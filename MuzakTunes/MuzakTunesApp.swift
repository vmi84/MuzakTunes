//
//  MuzakTunesApp.swift
//  MuzakTunes
//
//  Created by Jeff White on 3/11/25.
//

import SwiftUI

@main
struct MuzakTunesApp: App {
    // Replace with your actual Jamendo client ID
    private let jamendoService = JamendoService(clientId: "YOUR_CLIENT_ID")
    
    var body: some Scene {
        WindowGroup {
            SearchView(jamendoService: jamendoService)
        }
    }
}
