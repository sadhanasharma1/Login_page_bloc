class AuthService {
  List<Map<String, String>> _registeredUsers = [];

  Future<bool> login(String username, String password) async {
    for (var user in _registeredUsers) {
      if (user['username'] == username && user['password'] == password) {
        return true;
      }
    }
    return false;
  }

  Future<bool> signup(String username, String password) async {
    for (var user in _registeredUsers) {
      if (user['username'] == username) {
        return false; // User already exists
      }
    }
    _registeredUsers.add({'username': username, 'password': password});
    return true;
  }
}
