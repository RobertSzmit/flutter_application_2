import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/my_account/cubit/my_account_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyAccountCubit()..loadUserData(),
      child: BlocBuilder<MyAccountCubit, MyAccountState>(
        builder: (context, state) {
          if (state is MyAccountLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MyAccountLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Witaj, ${state.username}!'),
                  const SizedBox(height: 10),
                  Text('Jesteś zalogowany jako ${state.email}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MyAccountCubit>().signOut();
                    },
                    child: const Text('Wyloguj'),
                  ),
                ],
              ),
            );
          } else if (state is MyAccountError) {
            return Center(child: Text(state.message));
          } else if (state is MyAccountSignedOut) {
            // Navigate to login page or show a message
            return const Center(child: Text('Wylogowano'));
          }
          return const Center(child: Text('Nieznany stan'));
        },
      ),
    );
  }
}
