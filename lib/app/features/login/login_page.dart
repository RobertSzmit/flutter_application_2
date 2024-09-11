import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/repositories/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/app/features/login/cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepository()),
      child: const LoginPageContent(),
    );
  }
}

class LoginPageContent extends StatelessWidget {
  const LoginPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final usernameController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
        // Usuńmy stąd nawigację, ponieważ RootPage zajmie się zmianą widoku po zalogowaniu
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:
                Text(state.isCreateAccount ? 'Zarejestruj się' : 'Zaloguj się'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'E-mail'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(hintText: 'Hasło'),
                    obscureText: true,
                  ),
                  if (state.isCreateAccount)
                    TextField(
                      controller: usernameController,
                      decoration:
                          const InputDecoration(hintText: 'Nazwa użytkownika'),
                    ),
                  const SizedBox(height: 20),
                  if (state.isLoading)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton(
                      onPressed: () {
                        if (state.isCreateAccount) {
                          context.read<LoginCubit>().signUp(
                                emailController.text,
                                passwordController.text,
                                usernameController.text,
                              );
                        } else {
                          context.read<LoginCubit>().signIn(
                                emailController.text,
                                passwordController.text,
                              );
                        }
                      },
                      child: Text(state.isCreateAccount
                          ? 'Zarejestruj się'
                          : 'Zaloguj się'),
                    ),
                  TextButton(
                    onPressed: () =>
                        context.read<LoginCubit>().toggleCreateAccount(),
                    child: Text(state.isCreateAccount
                        ? 'Masz już konto?'
                        : 'Utwórz konto'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
