import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userType;
  const HomeScreen({Key? key, required this.userType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home - $userType"), backgroundColor: Colors.orange[700]),
      body: Center(
        child: Text("Welcome $userType user!", style: const TextStyle(fontSize: 22)),
      ),
    );
  }
}
