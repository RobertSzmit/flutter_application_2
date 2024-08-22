part of 'news_banner_cubit.dart';

@immutable
class NewsBannerState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> banners;
  final bool isLoading;
  final String errorMessage;

  const NewsBannerState({
    required this.banners,
    required this.isLoading,
    required this.errorMessage,
  });
}
