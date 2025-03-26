import 'package:flutter/material.dart';
import 'home_page.dart';
import 'users_page.dart';
import 'rewards_page.dart';
import 'settings_page.dart';

class AppScaffold extends StatefulWidget {
  final bool isAdmin;
  final String username;

  const AppScaffold({
    Key? key,
    required this.isAdmin,
    required this.username,
  }) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentIndex = 0;

  late final List<Widget> _pages = [
    HomePage(username: widget.username),
    const UsersPage(),
    const RewardsPage(),
    SettingsPage(username: widget.username),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(['Home', 'Users', 'Rewards', 'Settings'][_currentIndex]),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}