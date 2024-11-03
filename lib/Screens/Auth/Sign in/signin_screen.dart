import 'package:flutter/material.dart';
import 'package:store_app/Export/export_dev.dart';
import 'package:store_app/data/Services/WpServices.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _token; // Store JWT token in the app state

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      await services.login(username, password, context);

      if (services.token != null) {
        setState(() {
          _token = services.token; // Save token in the state
        });
        print("Logged in. Token: $_token");

        // Navigate to the HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigation()),
        );
      } else {
        print("Login failed. Token is null.");
      }
    } else {
      print("Username or password is empty or Invalid");
    }
  }

  WpServices services = WpServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EcomFlutter Login"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: Text("Login"),
                ),
                if (_token != null) ...[
                  SizedBox(height: 20),
                ],
                Row(
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => SignUpScreen()),
                        );
                      },
                      child: Text("Sign Up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
