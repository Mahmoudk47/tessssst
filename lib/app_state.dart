// Singleton class to manage app state
class AppData {
  static final AppData _instance = AppData._internal();
  factory AppData() => _instance;

  Map<String, String> users;
  Map<String, int> points;
  List<Map<String, dynamic>> tasks;
  List<Map<String, dynamic>> rewards;

  AppData._internal()
      : users = {'Admin': '123'},
        points = {'Admin': 100},
        tasks = [
          {'name': 'Learn Flutter', 'points': 20, 'assignedTo': 'Admin'},
          {'name': 'Build App', 'points': 50, 'assignedTo': 'User1'},
        ],
        rewards = [
          {'name': 'Coffee', 'cost': 30},
          {'name': 'Lunch', 'cost': 100},
        ];
}
