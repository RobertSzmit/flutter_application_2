import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/news/cubit/news_banner_cubit.dart';
import 'package:flutter_application_2/app/features/news/news_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/app/features/news/banner_row_widget.dart';

class NewsBannerPageView extends StatelessWidget {
  const NewsBannerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                itemCount: state.banners.length,
                itemBuilder: (context, index) {
                  final banner = state.banners[index].data();
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
                              banner['date'] ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
