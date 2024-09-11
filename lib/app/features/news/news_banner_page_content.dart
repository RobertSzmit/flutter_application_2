import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/news/cubit/news_banner_cubit.dart';
import 'package:flutter_application_2/app/repositories/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/app/features/news/news_banner_page_view.dart';

class NewsBannerPageContent extends StatelessWidget {
  const NewsBannerPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBannerCubit(NewsRepository())..start(),
      child: const NewsBannerPageView(),
    );
  }
}
