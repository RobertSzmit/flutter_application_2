import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/app/models/news_item_model.dart';
import 'package:flutter_application_2/app/repositories/news_repository.dart';
import 'package:flutter_application_2/app/services/notification_service.dart';

import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _repository;

  NewsCubit(this._repository) : super(const NewsState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(state.copyWith(isLoading: true));
    _streamSubscription = _repository.streamNewsItems().listen(
      (newsItems) {
        emit(state.copyWith(newsItems: newsItems, isLoading: false));
      },
      onError: (error) {
        emit(state.copyWith(errorMessage: error.toString(), isLoading: false));
      },
    );

    await NotificationService.subscribeToNewsTopic();
  }

  Future<void> loadNewsDetails(String newsId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final newsItem = await _repository.getNewsDetails(newsId);
      final updatedItems = List<NewsItem>.from(state.newsItems);
      final index = updatedItems.indexWhere((item) => item.id == newsId);
      if (index != -1) {
        updatedItems[index] = newsItem;
      } else {
        updatedItems.add(newsItem);
      }
      emit(state.copyWith(newsItems: updatedItems, isLoading: false));
    } catch (error) {
      emit(state.copyWith(errorMessage: error.toString(), isLoading: false));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
