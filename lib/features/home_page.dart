import 'package:flutter/material.dart';
import '../app_state.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appData = AppData();

  @override
  Widget build(BuildContext context) {
    final userTasks = appData.tasks
        .where((task) => task['assignedTo'] == widget.username)
        .toList();

    return ListView.builder(
      itemCount: userTasks.length,
      itemBuilder: (context, index) {
        final task = userTasks[index];
        return Card(
          child: ListTile(
            title: Text(task['name']),
            subtitle: Text('${task['points']} points'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.check, color: Colors.green),
                  onPressed: () => _completeTask(task),
                ),
                IconButton(
                  icon: const Icon(Icons.undo, color: Colors.orange),
                  onPressed: () => _undoTask(task),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _completeTask(Map<String, dynamic> task) {
    setState(() {
      appData.points[widget.username] =
          (appData.points[widget.username] ?? 0) + (task['points'] as int);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('+${task['points']} points!')),
    );
  }

  void _undoTask(Map<String, dynamic> task) {
    setState(() {
      appData.points[widget.username] =
          (appData.points[widget.username] ?? 0) - (task['points'] as int);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('-${task['points']} points!')),
    );
  }
}
