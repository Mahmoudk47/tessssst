import 'package:flutter/material.dart';
import '../app_state.dart';
import '../features/app_scaffold.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLogin ? 'Login' : 'Sign Up',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) => value!.length < 3 ? 'Too short' : null,
              ),
              if (!isLogin) ...[
                const SizedBox(height: 15),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Confirm Password'),
                  validator: (value) =>
                      value != _passwordController.text ? 'Mismatch' : null,
                ),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleAuth,
                child: Text(isLogin ? 'Login' : 'Sign Up'),
              ),
              TextButton(
                onPressed: () => setState(() => isLogin = !isLogin),
                child: Text(
                    isLogin ? 'Create account' : 'Already have an account?'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleAuth() {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      final appData = AppData();

      if (isLogin) {
        if (appData.users[username] == password) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => AppScaffold(
                isAdmin: username == 'Admin',
                username: username,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid credentials')),
          );
        }
      } else {
        appData.users[username] = password;
        appData.points[username] = 0;
        setState(() => isLogin = true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created! Please login')),
        );
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
