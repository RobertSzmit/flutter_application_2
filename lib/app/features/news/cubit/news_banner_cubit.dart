import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_2/app/models/banner_item_model.dart';

part 'news_banner_state.dart';

class NewsBannerCubit extends Cubit<NewsBannerState> {
  NewsBannerCubit()
      : super(
          const NewsBannerState(
            bannerItems: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const NewsBannerState(
        bannerItems: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('banner')
        .snapshots()
        .listen((snapshot) {
      final bannerItems = snapshot.docs.map((doc) => BannerItem(
            id: doc.id,
            date: doc['date'] as String? ?? '',
            team1Name: doc['team1Name'] as String? ?? '',
            team1Logo: doc['team1Logo'] as String? ?? '',
            team1Score: doc['team1Score'] as String? ?? '',
            team2Name: doc['team2Name'] as String? ?? '',
            team2Logo: doc['team2Logo'] as String? ?? '',
            team2Score: doc['team2Score'] as String? ?? '',
          )).toList();
      emit(
        NewsBannerState(
          bannerItems: bannerItems,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          NewsBannerState(
            bannerItems: [],
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