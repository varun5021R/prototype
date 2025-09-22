import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'welcome_screen.dart';

const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyA483_j0pqHV_fVC4hr0LR5RtE7CnNsP30",
  authDomain: "prototype-88ffc.firebaseapp.com",
  projectId: "prototype-88ffc",
  storageBucket: "prototype-88ffc.appspot.com",
  messagingSenderId: "653577601470",
  appId: "1:653577601470:web:cc6bd58d9c7aca2958b9ef",
  measurementId: "G-TJPM168KC5",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: firebaseConfig,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Wheels',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const WelcomeScreen(),
    );
  }
}
