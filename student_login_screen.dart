import 'package:flutter/material.dart';
import 'home_screen.dart';

class StudentLoginScreen extends StatelessWidget {
  const StudentLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Login"), backgroundColor: Colors.orange[700]),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Student login form here"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen(userType: 'student')),
                        (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[700]),
                child: const Text("Login"),
              )
            ],
          )),
    );
  }
}
