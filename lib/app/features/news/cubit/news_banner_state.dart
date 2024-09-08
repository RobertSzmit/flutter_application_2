part of 'news_banner_cubit.dart';

@immutable
class NewsBannerState {
  final List<BannerItem> bannerItems;
  final bool isLoading;
  final String errorMessage;

  const NewsBannerState({
    required this.bannerItems,
    required this.isLoading,
    required this.errorMessage,
  });
}