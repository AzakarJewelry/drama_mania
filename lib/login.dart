import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Color(0xFF171A1F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF3C63F)), // Set icon color
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Color(0xFF171A1F), // Set background color for the entire screen
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'STREAMSCAPE',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF3C63F),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email or Username',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF3C63F)),
                ),
                labelStyle: TextStyle(color: Color(0xFFF3C63F)),
              ),
              style: TextStyle(color: Color(0xFFF3C63F)),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF3C63F)),
                ),
                labelStyle: TextStyle(color: Color(0xFFF3C63F)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {},
                ),
              ),
              obscureText: true,
              style: TextStyle(color: Color(0xFFF3C63F)),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color(0xFFF3C63F)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Implement login logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF3C63F), // Set button color
                foregroundColor: Color(0xFF171A1F), // Set text color
                minimumSize: const Size(double.infinity, 50), // Set width and height
              ),
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}