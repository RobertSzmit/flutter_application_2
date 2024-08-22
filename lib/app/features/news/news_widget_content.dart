import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/news/cubit/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => NewsCubit()..start(),
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
            final documents = state.documents;

            return ListView(
              children: [
                for (final document in documents) ...[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: ListTile(
                        leading: document['image_url'] != null
                            ? Image.network(
                                document['image_url'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error);
                                },
                              )
                            : const SizedBox(width: 50, height: 50),
                        title: Text(document['news_title']),
                        subtitle: Text(document['news_content']),
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
