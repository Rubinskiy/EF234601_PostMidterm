import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String _errorCode = "";

  void navigateLogin() {
    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, 'login');
  }

  void navigateHome() {
    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, 'home');
  }

  void register() async {
    setState(() {
      _isLoading = true;
      _errorCode = "";
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      navigateHome();
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == "invalid-email") {
          _errorCode = "Email is Invalid ❌";
        } else if (e.code == "missing-password") {
          _errorCode = "Password is Missing ❌";
        } else if (e.code == "weak-password") {
          _errorCode = "Password is too Weak ❌";
        } else if (e.code == "email-already-in-use") {
          _errorCode = "Email Already in Use ❌";
        } else if (e.code == "operation-not-allowed") {
          _errorCode = "Operation Not Allowed ❌";
        } else {
          _errorCode = e.code;
        }
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Dupe'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 48),
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                height: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 12.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 31, 31, 31),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 31, 31, 31),
                        width: 1.0,
                      ),
                    ),
                    fillColor: const Color.fromARGB(255, 31, 31, 31),
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 12.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 31, 31, 31),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 31, 31, 31),
                        width: 1.0,
                      ),
                    ),
                    fillColor: const Color.fromARGB(255, 31, 31, 31),
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _errorCode != ""
                ? Column (
                  children: [
                    Text(
                      _errorCode,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ), 
                    const SizedBox(height: 12)
                  ]
                ) : const SizedBox(height: 0),
              Container(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 31, 31, 31),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 60,
                child: OutlinedButton(
                  onPressed: register,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: navigateLogin,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF9D50DD),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}