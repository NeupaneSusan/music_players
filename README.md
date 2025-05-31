# Music Player

A Flutter-based music player application with a modern UI and smooth playback controls.

## Features

- 🎵 Play local audio files
- ⏯️ Play/Pause functionality
- ⏭️ Next/Previous song navigation
- 🎚️ Interactive slider for seeking through songs
- 🔄 Automatic playback of next song
- 🎨 Modern and clean UI design
- 📱 Responsive layout using ScreenUtil

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/music_player.git
```

2. Navigate to the project directory:
```bash
cd music_player
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── constant/
│   └── music_list.dart      # List of available music
├── controller/
│   └── music_player_controller.dart  # Music player logic
├── page/
│   └── home_page.dart       # Main UI implementation
└── main.dart                # App entry point
```

## Dependencies

- `flutter_mobx`: For state management
- `just_audio`: For audio playback
- `flutter_screenutil`: For responsive UI

## Usage

1. Launch the app
2. Browse through the music list
3. Use the play/pause button to control playback
4. Use the slider to seek through the current song
5. Use next/previous buttons to navigate between songs

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter team for the amazing framework
- just_audio package for audio playback functionality
- flutter_mobx for state management
