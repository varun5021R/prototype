import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  final String role; // 'student', 'driver', or 'admin'
  const LoginScreen({Key? key, required this.role}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _regNoController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;

  Future<void> _login() async {
    setState(() { loading = true; });
    try {
      final regNo = _regNoController.text.trim();
      final password = _passwordController.text.trim();
      final email = regNo + "@campus.com";

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final doc = await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).get();

      if (!doc.exists || doc.get('role') != widget.role) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Unauthorized: wrong role for this user')),
        );
        setState(() { loading = false; });
        return;
      }

      Navigator.pushReplacementNamed(context, '/home', arguments: {'role': widget.role});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
    }
    setState(() { loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login as ${widget.role}')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _regNoController,
              decoration: const InputDecoration(labelText: 'Registration Number'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            loading ? CircularProgressIndicator() :
            ElevatedButton(
              child: const Text('Login'),
              onPressed: _login,
            ),
          ],
        ),
      ),
    );
  }
}
