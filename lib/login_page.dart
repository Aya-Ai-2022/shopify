

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/auth.dart';
import 'package:shopify/signup.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform login logic
                // For simplicity, just check if email and password are not empty
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                if (email.isNotEmpty && password.isNotEmpty) {
                  // Perform actual login here
                  // For simplicity, just set the user as logged in
                  Provider.of<UserProvider>(context, listen: false).login();
                } else {
             
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter email and password.'),
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navigate to signup page
                   Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignUpPage()),
            );
                // For simplicity, you can implement a signup page separately
              },
              child: const Text('Don\'t have an account? Sign up here.'),
            ),
          ],
        ),
      ),
    );
  }
}





