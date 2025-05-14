# Android Todo App

A simple Todo List application built with Flutter for Android.

## Features

- Add new tasks with a title
- Mark tasks as completed with a checkbox
- Delete tasks
- Persistent storage using SharedPreferences

## Getting Started

### Prerequisites

- Flutter SDK (2.17.0 or higher)
- Android Studio or VS Code with Flutter plugins

### Installation

1. Clone this repository
2. Navigate to the project directory
3. Install Flutter SDK from https://flutter.dev/docs/get-started/install
4. Add Flutter to your PATH
5. Run `flutter pub get` to install dependencies
6. Run `flutter run` to start the app on your device or emulator

### Running on macOS

If you're using macOS, follow these steps:

1. Install Flutter SDK:
   ```
   brew install flutter
   ```

2. Verify installation:
   ```
   flutter doctor
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Run the app:
   ```
   flutter run
   ```

## Project Structure

- `lib/main.dart` - Entry point of the application
- `lib/models/task.dart` - Task model class with JSON serialization
- `lib/components/todo_item.dart` - Reusable widget for displaying tasks
- `lib/components/todo_screen.dart` - Main Todo screen with task management logic
- `lib/utils/task_storage.dart` - Utility for saving/loading tasks with SharedPreferences

## Dependencies

- `shared_preferences` - For local storage of tasks
- `uuid` - For generating unique IDs for tasks
- `provider` - For state management (not used in this simple implementation but included for potential expansion)