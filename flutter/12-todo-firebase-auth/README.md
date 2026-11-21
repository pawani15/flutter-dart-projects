# Todo App – Firebase Authentication 🔐

## Overview

A Flutter todo application with Firebase Authentication. Each user registers or logs in with email and password, and their todos are saved in Cloud Firestore so they are kept between sessions and devices.

## Features

- Register with email and password
- Log in and log out
- Stay signed in after restarting the app
- Add tasks with a title and description
- Edit tasks
- Mark tasks as completed
- Delete tasks
- Todos saved per user in Cloud Firestore with live updates
- Form validation and friendly error messages

## Technologies

- Flutter
- Dart
- Firebase Core
- Firebase Authentication
- Cloud Firestore
- StreamBuilder

## Project Structure

```text
todo_firebase_app/
├── lib/
│   ├── main.dart
│   ├── firebase_options.dart
│   ├── models/
│   │   └── todo_model.dart
│   ├── services/
│   │   ├── auth_service.dart
│   │   └── todo_service.dart
│   └── screens/
│       ├── auth_wrapper.dart
│       ├── login_screen.dart
│       ├── register_screen.dart
│       └── home_screen.dart
├── android/
└── pubspec.yaml
```

## Firestore Data Structure

```text
users/{userId}/todos/{todoId}
  title:       string
  description: string
  isCompleted: bool
  createdAt:   timestamp
```

## Firebase Setup

1. Create a project in the [Firebase Console](https://console.firebase.google.com/).
2. Enable **Authentication → Sign-in method → Email/Password**.
3. Create a **Cloud Firestore** database.
4. Connect the app:

```bash
dart pub global activate flutterfire_cli
cd todo_firebase_app
flutterfire configure
```

5. Add these Firestore security rules so users can only read and write their own todos:

```text
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId}/todos/{todoId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

## Commands

```bash
flutter pub add firebase_core firebase_auth cloud_firestore
flutter pub get
flutter analyze
flutter run
```
