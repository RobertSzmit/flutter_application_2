import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/home/chat/chat_page_content.dart';
import 'package:flutter_application_2/app/home/my_account/my_account_page_content.dart';
import 'package:flutter_application_2/app/home/news/news_page_content.dart';
import 'package:flutter_application_2/app/home/schedule/schedule_page_content.dart';
import 'package:flutter_application_2/app/home/table/table_page_content.dart';

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
          return const NewsPageContent();
        }
        if (currentIndex == 1) {
          return const TablePageContent();
        }

        if (currentIndex == 2) {
          return const SchedulePageContent();
        }
        if (currentIndex == 3) {
          return const ChatPageContent();
        }
        return MyAccountPageContent(email: widget.user.email);
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
