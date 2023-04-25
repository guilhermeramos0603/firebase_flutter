import 'package:firebase_flutter_app/view/home_page.dart';
import 'package:firebase_flutter_app/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  @override
  initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      switch (user) {
        case null:
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false);
          break;
        default:
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
