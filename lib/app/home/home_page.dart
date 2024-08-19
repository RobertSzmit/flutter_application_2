import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const Center(
            child: Text('Aktualności'),
          );
        }
        if (currentIndex == 1) {
          return Center(
            child: Text('Tabela'),
          );
        }
        if (currentIndex == 2) {
          return Center(
            child: Text('Terminarz'),
          );
        }
        if (currentIndex == 3) {
          return Center(
            child: Text('Czat'),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Jesteś zalogowany jako ${widget.user.email}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut(); // to służy do wylogowywania
                },
                child: const Text('Wyloguj'),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Aktualności',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            label: 'Tabela',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Terminarz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Czat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Moje konto',
          ),
        ],
      ),
    );
  }
}
