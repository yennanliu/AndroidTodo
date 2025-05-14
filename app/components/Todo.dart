import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/task.dart';
import '../utils/task_storage.dart';
import 'TodoItem.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Task> _tasks = [];
  final TextEditingController _textController = TextEditingController();
  final _uuid = const Uuid();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasks = await TaskStorage.loadTasks();
    setState(() {
      _tasks = tasks;
      _isLoading = false;
    });
  }

  Future<void> _addTask() async {
    if (_textController.text.trim().isEmpty) return;

    final newTask = Task(
      id: _uuid.v4(),
      title: _textController.text.trim(),
    );

    setState(() {
      _tasks.add(newTask);
      _textController.clear();
    });

    await TaskStorage.saveTasks(_tasks);
  }

  Future<void> _toggleTask(String id, bool? isCompleted) async {
    setState(() {
      final taskIndex = _tasks.indexWhere((task) => task.id == id);
      if (taskIndex != -1) {
        _tasks[taskIndex].isCompleted = isCompleted ?? false;
      }
    });

    await TaskStorage.saveTasks(_tasks);
  }

  Future<void> _deleteTask(String id) async {
    setState(() {
      _tasks.removeWhere((task) => task.id == id);
    });

    await TaskStorage.saveTasks(_tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Add a new task',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTask(),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _tasks.isEmpty
                    ? const Center(child: Text('No tasks yet'))
                    : ListView.builder(
                        itemCount: _tasks.length,
                        itemBuilder: (context, index) {
                          final task = _tasks[index];
                          return TodoItem(
                            task: task,
                            onToggle: (isCompleted) => 
                                _toggleTask(task.id, isCompleted),
                            onDelete: () => _deleteTask(task.id),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
} 