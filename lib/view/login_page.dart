import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  void checkAuthentication() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: _mailController.text, password: _passwordController.text);
      if (userCredential != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Ops, e-mail incorrect."),
            backgroundColor: Colors.redAccent,
          ));
          break;
        case "wrong-password":
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Ops, password incorrect."),
            backgroundColor: Colors.redAccent,
          ));
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Ops, uknowledge error, try again."),
            backgroundColor: Colors.redAccent,
          ));
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                child: Icon(Icons.people),
              ),
              TextFormField(
                controller: _mailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Writing your E-mail address here.',
                  labelText: 'Name *',
                ),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'Writing yout password here',
                  labelText: 'Password *',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    checkAuthentication();
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
