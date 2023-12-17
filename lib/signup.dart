import 'package:flutter/material.dart';
import 'package:shopify/login_page.dart';
import 'package:shopify/validation.dart';



class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child:SignUpForm(),
      ),

    );}}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              final String name = nameController.text.trim();
              final String email = emailController.text.trim();
              final String password = passwordController.text.trim();

              if (isValidName(name) && isValidEmail(email) && isValidPassword(password)) {
                // Implement your signup logic here

                // For example, navigate to login page after successful signup
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid input. Please check your details.'),
                  ),
                );
              }
            },
            child: const Text('Sign Up'),
          ),
          const SizedBox(height: 16.0),
          TextButton(
            onPressed: () {
              // Navigate back to login screen
              Navigator.pop(context);
            },
            child: const Text('Already registered? Login here'),
          ),
        ],
      ),
    );
  }

 
}
