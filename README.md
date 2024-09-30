# Scare Flutter

Welcome to the Scare Flutter project! This repository contains a Flutter mobile application that allows you to play any audio file sent from a command server through Firebase Cloud Messaging (FCM) notifications. Perfect for developers looking to create engaging audio experiences or users interested in unique sound interactions.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **Audio Playback**: Play audio files received from a remote server via FCM notifications.
- **Real-Time Notifications**: Trigger audio playback instantly through push notifications.
- **Cross-Platform**: Compatible with both iOS and Android devices.
- **Stealth Interface**: Designed to look like a under develop app

## Installation

To set up the Scare Flutter app, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/xrayian/scare-flutter.git
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd scare-flutter
   ```

3. **Install Dependencies**:
   Make sure you have Flutter installed. Then run:
   ```bash
   flutter pub get
   ```

4. **Configure Firebase**:
   - Follow the [Firebase setup guide](https://firebase.flutter.dev/docs/overview) to set up FCM for your project.
   - Add your `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) to the respective platform directories.

5. **Run the Application**:
   Connect your device or start an emulator and run:
   ```bash
   flutter run
   ```

## Usage

Once the app is running:

1. Ensure your device is connected to the internet.
2. Send a test FCM notification with the audio file URL.
3. Upon receiving the notification, the app will automatically play the specified audio file.

## Contributing

We welcome contributions to improve the Scare Flutter app! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a pull request.

Please follow the project's coding standards and best practices.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or feedback, please reach out:

- **Author**: [xrayian](https://github.com/xrayian)
- **Email**: rayianmahi@gmail.com
