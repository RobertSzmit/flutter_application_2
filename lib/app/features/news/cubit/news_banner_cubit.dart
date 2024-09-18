import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/app/models/banner_item_model.dart';
import 'package:flutter_application_2/app/repositories/news_repository.dart';

import 'news_banner_state.dart';

class NewsBannerCubit extends Cubit<NewsBannerState> {
  final NewsRepository _repository;

  NewsBannerCubit(this._repository) : super(const NewsBannerState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(state.copyWith(isLoading: true, bannerItems: []));

    _streamSubscription = _repository.streamBannerItems().listen(
      (bannerItems) {
        emit(state.copyWith(
          bannerItems: bannerItems,
          isLoading: false,
        ));
      },
      onError: (error) {
        emit(state.copyWith(
          bannerItems: [],
          isLoading: false,
          errorMessage: error.toString(),
        ));
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}