import 'package:flutter/material.dart';
import '../auth/auth_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AuthScreen()),
              );
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
