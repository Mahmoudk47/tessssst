import 'package:flutter/material.dart';
import '../app_state.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key}); // No username parameter here

  @override
  Widget build(BuildContext context) {
    final appData = AppData();
    final sortedUsers = appData.users.keys.toList()
      ..sort(
          (a, b) => (appData.points[b] ?? 0).compareTo(appData.points[a] ?? 0));

    return ListView.builder(
      itemCount: sortedUsers.length,
      itemBuilder: (context, index) {
        final user = sortedUsers[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(user),
            subtitle: Text('${appData.points[user]} points'),
          ),
        );
      },
    );
  }
}
