import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/app/models/banner_item_model.dart';
import 'package:flutter_application_2/app/models/news_item_model.dart';

class NewsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<BannerItem>> streamBannerItems() {
    return _firestore.collection('banner').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => BannerItem(
                id: doc.id,
                date: doc['date'] as String? ?? '',
                team1Name: doc['team1Name'] as String? ?? '',
                team1Logo: doc['team1Logo'] as String? ?? '',
                team1Score: doc['team1Score'] as String? ?? '',
                team2Name: doc['team2Name'] as String? ?? '',
                team2Logo: doc['team2Logo'] as String? ?? '',
                team2Score: doc['team2Score'] as String? ?? '',
              ))
          .toList();
    });
  }

  Stream<List<NewsItem>> streamNewsItems() {
    return _firestore.collection('news').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => NewsItem(
                id: doc.id,
                title: doc['news_title'] as String? ?? '',
                content: doc['news_content'] as String? ?? '',
                imageUrl: doc['image_url'] as String?,
              ))
          .toList();
    });
  }

  Future<NewsItem> getNewsDetails(String newsId) async {
    final doc = await _firestore.collection('news').doc(newsId).get();
    if (!doc.exists) {
      throw Exception('News not found');
    }
    return NewsItem(
      id: doc.id,
      title: doc['news_title'] as String? ?? '',
      content: doc['news_content'] as String? ?? '',
      imageUrl: doc['image_url'] as String?,
      details: doc['news_details'] as String?,
    );
  }
}
