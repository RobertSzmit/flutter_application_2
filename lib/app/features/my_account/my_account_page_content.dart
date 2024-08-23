import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/cubit/root_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          FutureBuilder<String?>(
            future: _getUsernameFromFirestore(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              final username = snapshot.data ?? 'Nieznany użytkownik';
              return Column(
                children: [
                  Text('Witaj, $username!'),
                  const SizedBox(height: 10),
                  Text('Jesteś zalogowany jako $email'),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<RootCubit>().signOut();
            },
            child: const Text('Wyloguj'),
          ),
        ],
      ),
    );
  }

  Future<String?> _getUsernameFromFirestore() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final doc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        return doc.data()?['username'] as String?;
      }
    } catch (e) {
      print('Błąd podczas pobierania nazwy użytkownika z Firestore: $e');
    }
    return null;
  }
}
