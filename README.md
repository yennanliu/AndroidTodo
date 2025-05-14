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
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app on your device or emulator

## Project Structure

- `app/main.dart` - Entry point of the application
- `app/models/task.dart` - Task model class with JSON serialization
- `app/components/TodoItem.dart` - Reusable widget for displaying tasks
- `app/components/Todo.dart` - Main Todo screen with task management logic
- `app/utils/task_storage.dart` - Utility for saving/loading tasks with SharedPreferences

## Dependencies

- `shared_preferences` - For local storage of tasks
- `uuid` - For generating unique IDs for tasks
- `provider` - For state management (not used in this simple implementation but included for potential expansion)