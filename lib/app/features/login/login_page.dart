import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/app/features/login/cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is LoginSuccess) {
            // Nawiguj do głównego ekranu po udanym logowaniu/rejestracji
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state is SignUpInitial
                        ? 'Zarejestruj się'
                        : 'Zaloguj się'),
                    const SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(hintText: 'Hasło'),
                      obscureText: true,
                    ),
                    if (state is SignUpInitial) ...[
                      TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                            hintText: 'Nazwa użytkownika'),
                      ),
                    ],
                    const SizedBox(height: 20),
                    if (state is LoginLoading)
                      const CircularProgressIndicator()
                    else
                      ElevatedButton(
                        onPressed: () {
                          if (state is LoginInitial) {
                            context.read<LoginCubit>().signIn(
                                  emailController.text,
                                  passwordController.text,
                                );
                          } else if (state is SignUpInitial) {
                            context.read<LoginCubit>().signUp(
                                  emailController.text,
                                  passwordController.text,
                                  usernameController.text,
                                );
                          }
                        },
                        child: Text(state is SignUpInitial
                            ? 'Zarejestruj się'
                            : 'Zaloguj się'),
                      ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        context.read<LoginCubit>().toggleCreateAccount();
                      },
                      child: Text(state is LoginInitial
                          ? 'Utwórz konto'
                          : 'Masz już konto?'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
