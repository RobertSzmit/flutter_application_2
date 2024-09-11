import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_2/app/models/news_item_model.dart';
import 'package:flutter_application_2/app/repositories/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _repository;

  NewsCubit(this._repository)
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
    _streamSubscription = _repository.streamNewsItems().listen(
      (newsItems) {
        emit(
          NewsState(
            newsItems: newsItems,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
      onError: (error) {
        emit(
          NewsState(
            newsItems: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}