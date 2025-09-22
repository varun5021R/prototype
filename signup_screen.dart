import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  final String role; // 'student', 'driver', or 'admin'
  const SignupScreen({Key? key, required this.role}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _regNoController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;

  Future<void> _signup() async {
    setState(() { loading = true; });
    try {
      final regNo = _regNoController.text.trim();
      final password = _passwordController.text.trim();
      final email = regNo + "@campus.com";

      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
        'role': widget.role,
        'regNo': regNo,
        'createdAt': FieldValue.serverTimestamp(),
      });

      Navigator.pushReplacementNamed(context, '/home', arguments: {'role': widget.role});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed: $e')));
    }
    setState(() { loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup as ${widget.role}')),
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
              child: const Text('Sign Up'),
              onPressed: _signup,
            ),
          ],
        ),
      ),
    );
  }
}
