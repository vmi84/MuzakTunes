# MuzakTunes

MuzakTunes is an iOS music streaming application that leverages the Jamendo API to provide users with access to a vast library of free and legal music.

## Features

- Search and discover music from Jamendo's extensive library
- Stream music tracks with high-quality audio
- View artist and album information
- Modern SwiftUI interface with smooth animations
- Responsive and intuitive user experience

## Technical Requirements

### Platform & Dependencies
- iOS 16.0+
- Xcode 15+
- CocoaPods for dependency management

### Key Dependencies
- **Firebase Suite**
  - Firebase/Core
  - Firebase/Auth
  - Firebase/Firestore
  - Firebase/Storage
  - Firebase/Analytics
- **SDWebImageSwiftUI** for efficient image loading and caching

### Architecture
- MVVM (Model-View-ViewModel) architecture
- SwiftUI for the user interface
- Async/await for network operations
- Modular and scalable code structure

## Project Structure
```
MuzakTunes/
├── Models/
│   └── Track.swift
├── Views/
│   └── SearchView.swift
├── ViewModels/
│   └── TrackViewModel.swift
├── Services/
│   └── JamendoService.swift
└── Utils/
```

## Setup Instructions

1. Clone the repository
```bash
git clone [repository-url]
cd MuzakTunes
```

2. Install dependencies using CocoaPods
```bash
pod install
```

3. Open the workspace in Xcode
```bash
open MuzakTunes.xcworkspace
```

4. Configure Jamendo API
- Sign up for a Jamendo API key at [Jamendo Developer Portal](https://developer.jamendo.com)
- Replace `YOUR_CLIENT_ID` in `MuzakTunesApp.swift` with your actual Jamendo client ID

5. Build and run the project

## API Integration

The app uses the Jamendo API v3.0 for music streaming. Key endpoints include:
- `/tracks/` - Search and retrieve track information
- Proper attribution and compliance with Jamendo's terms of service

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [Jamendo](https://www.jamendo.com) for providing the music API
- The SwiftUI and iOS developer community
- All the artists who share their music through Jamendo 