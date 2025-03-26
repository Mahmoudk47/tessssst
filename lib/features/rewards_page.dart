import 'package:flutter/material.dart';
import '../app_state.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appData = AppData();
    return ListView.builder(
      itemCount: appData.rewards.length,
      itemBuilder: (context, index) {
        final reward = appData.rewards[index];
        return Card(
          child: ListTile(
            title: Text(reward['name']),
            subtitle: Text('${reward['cost']} points'),
          ),
        );
      },
    );
  }
}
