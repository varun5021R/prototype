import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Role"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Register as:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SignupScreen(role: 'student')));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Student Signup"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SignupScreen(role: 'driver')));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Driver Signup"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SignupScreen(role: 'admin')));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Admin Signup"),
            ),
            const SizedBox(height: 30),
            Text(
              'Or Login as:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => LoginScreen(role: 'student')));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Student Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => LoginScreen(role: 'driver')));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Driver Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => LoginScreen(role: 'admin')));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Admin Login"),
            ),
          ],
        ),
      ),
    );
  }
}
