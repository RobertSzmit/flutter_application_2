import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/table/cubit/table_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TablePageView extends StatelessWidget {
  const TablePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabela'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text('Nazwa drużyny',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Mecze',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Punkty',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Bramki',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TableCubit, TableState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.errorMessage.isNotEmpty) {
                  return Center(child: Text('Błąd: ${state.errorMessage}'));
                }
                return ListView.builder(
                  itemCount: state.teams.length,
                  itemBuilder: (context, index) {
                    final team = state.teams[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(team.teamName),
                          ),
                          Expanded(
                            flex: 1,
                            child:
                                Text(team.matches, textAlign: TextAlign.center),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(team.points.toString(),
                                textAlign: TextAlign.center),
                          ),
                          Expanded(
                            flex: 1,
                            child:
                                Text(team.goals, textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
