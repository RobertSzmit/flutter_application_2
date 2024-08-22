import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'news_banner_state.dart';

class NewsBannerCubit extends Cubit<NewsBannerState> {
  NewsBannerCubit()
      : super(
          const NewsBannerState(
            banners: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const NewsBannerState(
        banners: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('banner')
        .snapshots()
        .listen((snapshot) {
      emit(
        NewsBannerState(
          banners: snapshot.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          NewsBannerState(
            banners: [],
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
