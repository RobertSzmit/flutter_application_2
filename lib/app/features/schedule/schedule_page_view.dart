import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/schedule/cubit/schedule_cubit.dart';
import 'package:flutter_application_2/app/features/schedule/cubit/schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulePageView extends StatelessWidget {
  const SchedulePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terminarz'),
      ),
      body: BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.errorMessage.isNotEmpty) {
            return Center(child: Text('Błąd: ${state.errorMessage}'));
          }
          return ListView.builder(
            itemCount: state.schedules.length,
            itemBuilder: (context, index) {
              final schedule = state.schedules[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      schedule.date,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            schedule.homeTeam,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            schedule.score ?? ' - ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            schedule.awayTeam,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
