import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/news/cubit/news_banner_cubit.dart';
import 'package:flutter_application_2/app/features/news/cubit/news_cubit.dart';
import 'package:flutter_application_2/app/features/news/news_details_page.dart';
import 'package:flutter_application_2/app/repositories/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/app/features/news/banner_row_widget.dart';

class NewsBannerPageView extends StatelessWidget {
  const NewsBannerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(NewsRepository())..start(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: BlocBuilder<NewsBannerCubit, NewsBannerState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.errorMessage.isNotEmpty) {
                  return Center(child: Text('Błąd: ${state.errorMessage}'));
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.bannerItems.length,
                  itemBuilder: (context, index) {
                    final banner = state.bannerItems[index];
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
                                banner.date,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
          const NewsWidget(),
        ],
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Coś poszło nie tak: ${state.errorMessage}',
              ),
            );
          }
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final newsItems = state.newsItems;

          return ListView.builder(
            itemCount: newsItems.length,
            itemBuilder: (context, index) {
              final newsItem = newsItems[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: ListTile(
                    leading: newsItem.imageUrl != null
                        ? Image.network(
                            newsItem.imageUrl!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error);
                            },
                          )
                        : const SizedBox(width: 50, height: 50),
                    title: Text(newsItem.title),
                    subtitle: Text(newsItem.content),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailsPage(newsId: newsItem.id),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
