import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  final Color primaryGreen = const Color.fromARGB(255, 46, 119, 50);
  final Color primaryRed = const Color.fromARGB(255, 160, 38, 36);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [primaryGreen, primaryRed],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          Text(
                            isCreatingAccount
                                ? 'Zarejestruj się'
                                : 'Zaloguj się',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: primaryGreen,
                            ),
                          ),
                          const SizedBox(height: 40),
                          TextFormField(
                            controller: widget.emailController,
                            decoration: InputDecoration(
                              hintText: 'E-mail',
                              prefixIcon:
                                  Icon(Icons.email, color: primaryGreen),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: widget.passwordController,
                            decoration: InputDecoration(
                              hintText: 'Hasło',
                              prefixIcon: Icon(Icons.lock, color: primaryGreen),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            errorMessage,
                            style: TextStyle(color: primaryRed),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              if (isCreatingAccount) {
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: widget.emailController.text,
                                    password: widget.passwordController.text,
                                  );
                                } catch (error) {
                                  setState(() {
                                    errorMessage = error.toString();
                                  });
                                }
                              } else {
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                            ),
                            child: Text(
                              isCreatingAccount
                                  ? 'Zarejestruj się'
                                  : 'Zaloguj się',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = !isCreatingAccount;
                      });
                    },
                    child: Text(
                      isCreatingAccount ? 'Masz już konto?' : 'Utwórz konto',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
