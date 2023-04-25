import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  registerUser() {
    // Implement
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register User")),
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
                  hintText: 'Writing your Full name here.',
                  labelText: 'Name *',
                ),
              ),
              TextFormField(
                controller: _mailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: 'Writing your E-mail address here.',
                  labelText: 'E-mail *',
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
                  registerUser();
                },
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
