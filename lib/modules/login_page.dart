import 'package:flutter/material.dart';
import 'package:dice_app/modules/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  void loginUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        // Check if user is not null
        // Save user token
        saveUserToken(userCredential.user!); // Use the user property
        // Login successful, navigate to the home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // Handle null user object
        print("Failed to login: User object is null");
        // Show snack bar for invalid email/password combination
        showSnackbar(context, 'Invalid email or password');
      }
    } catch (e) {
      // Handle login errors
      print("Failed to login: $e");
      // You can show error messages to the user here
      showSnackbar(context, 'Invalid email or password');
    }
  }

  void saveUserToken(User user) async {
    // Store user token securely (e.g., using SharedPreferences)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (await user.getIdToken()) ?? ""; // Handle null case
    await prefs.setString('userToken', token);
  }

  Future<String?> getUserToken() async {
    // Retrieve user token securely
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }

  void autoLogin(BuildContext context) async {
    String? userToken = await getUserToken();
    if (userToken != null) {
      // User already logged in, navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Check if the user is already logged in
    autoLogin(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Login the user
                  loginUser(context);
                },
                child: const Text('LOGIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
