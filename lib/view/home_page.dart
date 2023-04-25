import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_app/view/check_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    void logOut() async {
      await _firebaseAuth.signOut().then((user) => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const CheckPage())));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Click here to Logout"),
              ElevatedButton(
                  onPressed: () {
                    logOut();
                  },
                  child: const Text("Logout"))
            ],
          ),
        ));
  }
}
