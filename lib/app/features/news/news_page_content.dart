import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/news/news_banner_page_content.dart';

class NewsPageContent extends StatelessWidget {
  const NewsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LKS Żuławy Nowy Dwór Gd.'),
      ),
      body: const NewsBannerPageContent(),
    );
  }
}
