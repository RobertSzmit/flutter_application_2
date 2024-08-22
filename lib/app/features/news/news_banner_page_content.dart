import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/news/banner_row_widget.dart';
import 'package:flutter_application_2/app/features/news/news_widget_content.dart';

class NewsBannerPageContent extends StatelessWidget {
  const NewsBannerPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Komponent z meczami
        SizedBox(
          height: 150,
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('banner').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Błąd ładowania meczów'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final banners = snapshot.data!.docs;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  final banner = banners[index].data();
                  return IntrinsicWidth(
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              banner['date'] ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            BannerRowWidget(banner: banner, teamKey: 'team1'),
                            const SizedBox(height: 8),
                            BannerRowWidget(banner: banner, teamKey: 'team2'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        // Napis "Co nowego"
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Co nowego",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // ListView z newsami
        const NewsWidget(),
      ],
    );
  }
}
