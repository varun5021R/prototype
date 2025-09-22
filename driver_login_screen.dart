import 'package:flutter/material.dart';
import 'home_screen.dart';

class DriverLoginScreen extends StatelessWidget {
  const DriverLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Login"),
        backgroundColor: Colors.orange[700],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Driver login form here"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen(userType: 'driver')),
                  (_) => false,
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[700]),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
