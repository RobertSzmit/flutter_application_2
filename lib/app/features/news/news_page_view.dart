import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/news/cubit/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPageView extends StatelessWidget {
  const NewsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage.isNotEmpty) {
          return Center(child: Text('Błąd: ${state.errorMessage}'));
        }
        final newsItems = state.newsItems;

        return ListView(
          children: [
            for (final newsItem in newsItems) ...[
              Padding(
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
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
