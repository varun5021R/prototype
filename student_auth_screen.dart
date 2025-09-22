import 'package:flutter/material.dart';
import 'home_screen.dart';

class StudentLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Login")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Student login form here"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen(userType: 'student')),
                        (route) => false,
                  );
                },
                child: Text("Login")
            ),
          ],
        ),
      ),
    );
  }
}
