import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_2/app/models/news_item_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit()
      : super(
          const NewsState(
            newsItems: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const NewsState(
        newsItems: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('news')
        .snapshots()
        .listen((data) {
      final newsItems = data.docs.map((doc) => NewsItem(
            id: doc.id,
            title: doc['news_title'] as String? ?? '',
            content: doc['news_content'] as String? ?? '',
            imageUrl: doc['image_url'] as String?,
          )).toList();
      emit(
        NewsState(
          newsItems: newsItems,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          NewsState(
            newsItems: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}