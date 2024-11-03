import 'package:flutter/material.dart';
import 'package:store_app/Export/export_dev.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  // Function to call the SignUp API service for customer registration
  Future<void> registerCustomer() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Call WooCommerceService to register the customer
      await WpServices.registerCustomer(
        email: _emailController.text,
        firstname: _firstnameController.text,
        lastname: _lastnameController.text,
        password: _passwordController.text,
      
      );

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Customer registered successfully')),
      );

      // Reset form after successful registration
      _formKey.currentState?.reset();

      // Navigate to the next screen (if you want to navigate)
      Navigator.push(context, MaterialPageRoute(builder: (builder) => LoginScreen()));
    } catch (error) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: error.toString().replaceAll('Exception: ', ''),
      );
      // // Show error SnackBar
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text(error.toString().replaceAll('Exception: ', ''))),
      // );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (_errorMessage.isNotEmpty)
                    Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  TextFormField(
                    controller: _firstnameController,
                    decoration: InputDecoration(labelText: 'First Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _lastnameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  _isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registerCustomer();
                      }
                    },
                    child: Text('Sign Up'),
                  ),
                  Row(
                    children: [
                      Text('Already have an account?'),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // Navigate to Login Screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (builder) =>  const LoginScreen()),
                          );
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
