import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/schedule/cubit/schedule_cubit.dart';
import 'package:flutter_application_2/app/features/schedule/schedule_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulePageContent extends StatelessWidget {
  const SchedulePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleCubit()..start(),
      child: const SchedulePageView(),
    );
  }
}
