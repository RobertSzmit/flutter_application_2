import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/cubit/root_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Jesteś zalogowany jako $email'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<RootCubit>().signOut(); // to służy do wylogowywania
            },
            child: const Text('Wyloguj'),
          ),
        ],
      ),
    );
  }
}
