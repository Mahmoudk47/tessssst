import '../app_state.dart';

class AuthLogic {
  static final appData = AppData();

  static bool validateCredentials(String username, String password) {
    return appData.users.containsKey(username) &&
        appData.users[username] == password;
  }

  static void createAccount(String username, String password) {
    appData.users[username] = password;
    appData.points[username] = 0;
  }

  static bool isAdmin(String username) {
    return username == 'Admin';
  }
}
