import 'dart:async';

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
  StreamSubscription? streamSubscription;

  @override
  initState() {
    super.initState();
    streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      switch (user) {
        case null:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
          break;
        default:
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
          break;
      }
    });
  }

  @override
  void dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
