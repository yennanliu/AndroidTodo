import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class TaskStorage {
  static const String _key = 'tasks';

  // Save tasks to SharedPreferences
  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks.map((task) => task.toJson()).toList();
    await prefs.setString(_key, jsonEncode(tasksJson));
  }

  // Load tasks from SharedPreferences
  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = prefs.getString(_key);
    
    if (tasksString == null) {
      return [];
    }
    
    final tasksJson = jsonDecode(tasksString) as List;
    return tasksJson.map((taskJson) => Task.fromJson(taskJson)).toList();
  }
} 