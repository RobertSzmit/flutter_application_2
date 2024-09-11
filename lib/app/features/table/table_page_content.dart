import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/features/table/cubit/table_cubit.dart';
import 'package:flutter_application_2/app/features/table/table_page_view.dart';
import 'package:flutter_application_2/app/repositories/table_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TablePageContent extends StatelessWidget {
  const TablePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TableCubit(TableRepository())..start(),
      child: const TablePageView(),
    );
  }
}
