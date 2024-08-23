import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController(); // Nowy kontroler

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isCreatingAccount ? 'Zarejestruj się' : 'Zaloguj się'),
              const SizedBox(height: 20),
              TextField(
                controller: widget.emailController,
                decoration: const InputDecoration(hintText: 'E-mail'),
              ),
              TextField(
                controller: widget.passwordController,
                decoration: const InputDecoration(hintText: 'Hasło'),
                obscureText: true,
              ),
              if (isCreatingAccount) ...[
                TextField(
                  controller: widget.usernameController,
                  decoration:
                      const InputDecoration(hintText: 'Nazwa użytkownika'),
                ),
              ],
              const SizedBox(height: 20),
              Text(errorMessage),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (isCreatingAccount) {
                    // Rejestracja
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );

                      // Aktualizacja profilu użytkownika
                      await userCredential.user
                          ?.updateDisplayName(widget.usernameController.text);

                      // Zapisz nazwę użytkownika w Firestore
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(userCredential.user?.uid)
                          .set({
                        'username': widget.usernameController.text,
                        'email': widget.emailController.text,
                      });
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  } else {
                    // Logowanie
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  }
                },
                child:
                    Text(isCreatingAccount ? 'Zarejestruj się' : 'Zaloguj się'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    isCreatingAccount = !isCreatingAccount;
                    errorMessage =
                        ''; // Czyścimy komunikat o błędzie przy przełączaniu
                  });
                },
                child: Text(
                    isCreatingAccount ? 'Masz już konto?' : 'Utwórz konto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
