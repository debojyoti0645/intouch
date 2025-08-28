# inTouch 💬

A modern, real-time chat application built with Flutter and Firebase. Stay connected with friends and family through instant messaging with a clean, intuitive interface.

## ✨ Features

- **Real-time Messaging**: Instant message delivery using Firebase Firestore
- **User Authentication**: Secure email/password authentication with Firebase Auth
- **Modern UI**: Clean, WhatsApp-inspired interface with smooth animations
- **Dark/Light Theme**: Toggle between dark and light themes
- **Message Timestamps**: Smart timestamp formatting (time, day, or date)
- **Responsive Design**: Optimized for different screen sizes
- **Password Visibility Toggle**: Eye icon to show/hide passwords
- **User List**: View all registered users and start conversations
- **Message Status**: Visual feedback for message sending
- **Auto Scroll**: Automatically scrolls to latest messages

## 🏗️ Project Structure

```
lib/
├── components/           # Reusable UI components
│   ├── chat_bubble.dart
│   ├── my_button.dart
│   ├── my_drawer.dart
│   ├── my_testfield.dart
│   └── user_tile.dart
├── models/              # Data models
│   └── messages.dart
├── pages/               # App screens
│   ├── chat_page.dart
│   ├── homepage.dart
│   ├── loginview.dart
│   ├── registerpage.dart
│   └── settingspage.dart
├── services/            # Business logic
│   ├── auth/
│   │   ├── auth_gate.dart
│   │   ├── auth_service.dart
│   │   └── loginorregister.dart
│   └── chat/
│       └── chat_services.dart
├── themes/              # App theming
│   ├── darkmode.dart
│   ├── lightmode.dart
│   └── theme_provider.dart
├── firebase_options.dart
└── main.dart
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.24.2
  firebase_auth: ^4.15.3
  cloud_firestore: ^4.13.6
  provider: ^6.1.1
  intl: ^0.18.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

## 📱 Usage Instructions

### Getting Started
1. **Launch the app** - The authentication gate will check if you're logged in
2. **Registration** - If new user, create account with email and password
3. **Login** - Sign in with your credentials if returning user

### Navigation
- **Home Screen** - View list of all registered users
- **Settings** - Access theme toggle and logout option
- **Drawer Menu** - Navigate between home and settings

### Chatting
1. **Start Conversation** - Tap on any user from the home screen
2. **Send Messages** - Type in the input field and tap send button
3. **Real-time Updates** - Messages appear instantly for both users
4. **Message Info** - Each message shows timestamp inline

### Features Usage
- **Theme Toggle** - Go to Settings → Toggle Dark Mode switch
- **Password Visibility** - Tap eye icon in password fields
- **Auto Scroll** - Chat automatically scrolls to newest messages
- **Logout** - Use drawer menu → Logout option

### Message Interface
- **Send Button** - Changes color when text is present
- **Input Field** - Supports multi-line messages
- **Message Bubbles** - Different colors for sent/received messages
- **Timestamps** - Smart formatting based on message age:
  - Today: Shows time (14:30)
  - This week: Shows day + time (Mon 14:30)
  - Older: Shows date + time (Jan 15, 14:30)

---

**Always keep inTouch** 🚀
